import '../../screens/templates/CardTemplate.dart';

class CardData{
  int uid;
  
  String cardTemplateCode;
  CardTemplate cardTemplate;

  String postId,title,thumbnail,requesterId,requesterName,requesterTitle;
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
    this.requesterTitle,
    this.messages,
    this.contacts,
    this.isVerified,
    this.footerText,
  });
  

  factory CardData.fromJson(Map<String, dynamic> json) {
    return CardData(
      uid:json['uid'],
      postId:json['postId'],
      title:json['title'],
      thumbnail:json['thumbnail'],
      requesterId:json['requesterId'],
      requesterName:json['requesterName'],
      requesterTitle:json['requesterTitle'],
      // messages:json['messages'],
      // contacts:json['contacts'],
      isVerified:json['isVerified'],
      footerText:json['footerText'],
    );
  }
  

}
class CardMessage {
  String body;
  DateTime time;

  
}