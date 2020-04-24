import 'package:firebase_auth/firebase_auth.dart';
//Here Happens all the Firebase Integrations...
import 'package:firebase_database/firebase_database.dart';
class FireBaseUser {
  String verificationId;
  final databaseReference = FirebaseDatabase.instance.reference();
  Future loginStatus() async {
    var isLoggedin = await FirebaseAuth.instance.currentUser();
    if (isLoggedin != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
 Future<String> userUid() async{
    var uid = await FirebaseAuth.instance.currentUser();
    return uid.uid;
  }
Future writeProfile(name,designation) async{
  try{
    var auth =userUid().then((value) {
      databaseReference.child('users').child(value).set({
        'name':name,
        'designation': designation
            });

    });
    }
  catch(e){
    print(e.details);
  }
  }


  //ToDo Complete Firebase storing Code

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
//      Navigator.of(context).pushReplacementNamed('/homepe');
//    }).catchError((e) {
//      print(e);
//    });
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: verificationCode,
    );
    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
  }
}
