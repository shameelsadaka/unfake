import 'package:firebase_auth/firebase_auth.dart';
//Here Happens all the Firebase Integrations...
import 'package:firebase_database/firebase_database.dart';
import 'package:itstrue/data/class/CardModel.dart';
import '../class/CardModel.dart';

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
        });
      });
    } catch (e) {
      print(e.details);
    }

  }
Future updateCard(postId,body){
userUid().then((value){
  databaseReference.child('posts').orderByChild('postId').equalTo(postId).once().then((DataSnapshot snap){
    var data = snap.value;
    var keys = snap.value.keys;

    if(data ==null){
      return null;
    }
    else{
      for(var key in keys)
      {
        int timeStamp = new DateTime.now().millisecondsSinceEpoch;
databaseReference.child('posts').child(key).child('messages').push().set({
  "body":body,
  "time":timeStamp
});

      }
    }

  });
});

}

 static getCardData(){
  List<CardModel> cardDataList= [];
  FirebaseDatabase.instance.reference()
      .child('posts').once().then((DataSnapshot snap) {
      var data = snap.value;
      var keys = snap.value.keys;
      for (var key in keys){
        print(data[key]);
        CardModel carddata = new CardModel
          (
          data[key]['postId'],
          data[key]['title'],
          data[key]['template'],
          data[key]['thumbnail'],
          data[key]['requesterId'],
          data[key]['requesterName'],
          data[key]['requesterTitle'],
          data[key]['isVerified'],
          data[key]['verifiedCount'],
          data[key]['message'],
          data[key]['contacts'].cast<String>(),

        );
cardDataList.add(carddata);
      }
    });
    return cardDataList;
    }
}


