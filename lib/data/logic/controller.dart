import 'package:itstrue/data/logic/firebase.dart';
import 'dart:math';
import 'package:random_string/random_string.dart';
import 'package:itstrue/data/class/CardModel.dart';

class DataHandler {
  final _auth = FireBaseUser();

  loginStatus() {
    if (_auth.loginStatus() != null) {
      return true;
    } else {
      return false;
    }
  }

  signOut() {
    _auth.signOut();
  }

  createCard() {
    String title =
        "കൊച്ചി അമൃത ഹോസപിറ്റലിൽ  ആക്സിഡന്‍റ് ആയി കിടക്കുന്ന യുവാവിന് നാല് കൂപ്പി A+ ബ്ലഡ് ആവശ്യമുണ്ട്‌.";
    String body =
        "രക്തം നല്‍കാന്‍ തയ്യാറായി 2 പേർ വന്നിട്ടുണ്ട്. 2 പേരെ കൂടി ആവശ്യമുണ്ട്";
    //General Defaults
    String template = 'red';
    bool isVerified = false;
    String thumbnail = 'blood_icon_red.png';

    //Generate Post ID and Card ID
    //timestamp
    int timeStamp = new DateTime.now().millisecondsSinceEpoch;
    //unique id generation using timestamp and random integer
    var rng = new Random();
    String uuid = '${timeStamp.toString()}${rng.nextInt(9).toString()}';
    int uid = int.parse(uuid);

    //Generate Post ID
    String alpha = randomAlpha(3).toUpperCase();
    String num = randomBetween(1, 1000).toString();
    String alphanumeric = alpha + num;

    //Passing datas to Firebase Function Class
    _auth.cardData(timeStamp, title, uid, alphanumeric, isVerified, template,
        thumbnail, body);
  }



    Future<List<CardModel>> getAllData(){
      return _auth.getCardData();
    }
}
