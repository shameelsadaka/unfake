import 'package:firebase_auth/firebase_auth.dart';
//Here Happens all the Firebase Integrations...
import 'package:firebase_database/firebase_database.dart';
import 'package:itstrue/data/class/CardModel.dart';

class FireBaseUser {
  String verificationId;
  final databaseReference = FirebaseDatabase.instance.reference();

  //User Data
  String userId;
  String userName = "User";
  String userTitle = "None";
  // Firebase Phone Auth
  Future loginStatus() async {
    return await FirebaseAuth.instance.currentUser();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String> userUid() async {
    var uid = await FirebaseAuth.instance.currentUser();
    this.userId = uid.uid;
    return uid.uid;
  }

  Future<bool> verifyPhone(phoneNumber) async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {
      print("Verified");
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
    };
    phoneNumber = '+91' + phoneNumber;
    print(phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  signIn(verificationCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );

    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
  }

  //Data Handling
  //ToDo Complete Firebase storing Code
  Future writeProfile(name, designation) async {
    try {
      userUid().then((value) {
        databaseReference
            .child('users')
            .child(value)
            .set({'name': name, 'designation': designation});
      });
    } catch (e) {
      print(e.details);
    }
  }

  Future cardData(timestamp, title, uid, alphanumeric, isVerified, template,
      thumbnail, body) async {
    try {
      userUid().then((value) {
        databaseReference.child('posts').push().set({
          "postId": alphanumeric,
          "title": title,
          "template": template,
          "thumbnail": thumbnail,
          "requesterId": this.userId, // Firebase User ID
          "requesterName": this.userName,
          "requesterTitle": this.userTitle,
          "messages": [
            {"body": body, "time": timestamp}
          ],
          "contacts": ["+91 9876543210", "+91 9956858388"],
          "isVerified": isVerified,
          "verifiedCount": 0,
          "status": true
        });
      });
    } catch (e) {
      print(e.details);
    }
  }

  Future updateCard(postId, body) {
    userUid().then((value) {
      databaseReference
          .child('posts')
          .orderByChild('postId')
          .equalTo(postId)
          .once()
          .then((DataSnapshot snap) {
        var data = snap.value;
        var keys = snap.value.keys;

        if (data == null) {
          return null;
        } else {
          for (var key in keys) {
            int timeStamp = new DateTime.now().millisecondsSinceEpoch;
            databaseReference
                .child('posts')
                .child(key)
                .child('messages')
                .push()
                .set({"body": body, "time": timeStamp});
          }
        }
      });
    });
  }


  Future deleteCard(postId) {
    userUid().then((value) {
      databaseReference
          .child('posts')
          .orderByChild('postId')
          .equalTo(postId)
          .once()
          .then((DataSnapshot snap) {
        var data = snap.value;
        var keys = snap.value.keys;

        if (data == null) {
          return false;
        } else {
          for (var key in keys) {
            if (this.userId == data[key]['requesterId']) {
              databaseReference.child('posts').child(key).remove();
              return true;
            } else {
              return false;
            }
          }
        }
        return false;
  });
          });
        }
  Future reportCard(postId) {
    userUid().then((value) {
      databaseReference
          .child('posts')
          .orderByChild('postId')
          .equalTo(postId)
          .once()
          .then((DataSnapshot snap) {
        var data = snap.value;
        var keys = snap.value.keys;
        print(data);

        if (data == null) {
          return false;
        } else {
          for (var key in keys) {
            var count = data[key]['reports'].length;
            //Set Status of Card to False if reported by 3 persons
            if (count >= 2) {
              databaseReference
                  .child('posts')
                  .child(key)
                  .set({"status": false});
            }
            //Adding reported user info to report tag
            databaseReference
                .child('posts')
                .child(key)
                .child('reports')
                .orderByChild('userId')
                .equalTo(this.userId)
                .once()
                .then((DataSnapshot snaps) {
              if (snaps.value == null) {
                databaseReference
                    .child('posts')
                    .child(key)
                    .child('reports')
                    .push()
                    .set({
                  "userId": this.userId,
                });
              }
            });
          }
        }
        return false;
      });
    });
  }

  searchCard(postId) {
    List<CardModel> searchedCardData = [];
    FirebaseDatabase.instance
        .reference()
        .orderByChild('postId')
        .equalTo(postId)
        .once()
        .then((DataSnapshot snap) {
      var data = snap.value;
      var keys = snap.value.keys;
      if (data != null) {
 for(var key in keys)
   {
     searchedCardData.add(new CardModel.fromJson(data[key]));
   }
      } else {
        return null;
      }
      return null;
    });
    return searchedCardData;
  }

  Future<List<CardModel>> getCardData() async {
    List<CardModel> cardDataList = [];
    await FirebaseDatabase.instance
        .reference()
        .child('posts')
        .once()
        .then((DataSnapshot snap) {


          var data = snap.value;
          var keys = snap.value.keys;
          for (var key in keys) {
              cardDataList.add(new CardModel.fromJson(data[key]));
          }
      }
    );
    return cardDataList;
  }


  Future<CardModel> getCardFromId(String postId) async {
    CardModel card;
    await FirebaseDatabase.instance
        .reference()
        .child('posts')
        .orderByChild('postId')
        .equalTo(postId)
        .once()
        .then((DataSnapshot snap) {
          var key = snap.value.keys.first;
          card = new CardModel.fromJson(snap.value[key]);
    }).catchError((e){
      print("Error while accessing card");
    });
    return card;
  }
  
  
}
