import 'package:firebase_auth/firebase_auth.dart';
//Here Happens all the Firebase Integrations...
import 'package:firebase_database/firebase_database.dart';

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
        databaseReference.child('posts').child('$uid').set({
          "uid": uid, // for app purpose
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
  Future getCard(){
    try {
      databaseReference.child('posts').orderByChild('requesterId').equalTo(this.userId);


    }
    catch(e){
      print(e.details);
    }
    }

}
