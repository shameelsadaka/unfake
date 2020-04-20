import '../../screens/templates/CardTemplate.dart';

class CardData{
  int uid;
  
  String cardTemplateCode;
  CardTemplate cardTemplate;

  String postId,title,thumbnail,requesterId,requesterName,requesterPosition;
  List<String> contacts;

  List<CardMessage> messages;

  bool isVerified;
  String footerText;

  CardData({
    this.uid,
    this.postId,
    this.title,
    this.thumbnail,
    this.requesterId,
    this.requesterName,
    this.requesterPosition,
    this.messages,
    this.isVerified,
    this.footerText,
  });

}
class CardMessage {
  String body;
  DateTime time;
}