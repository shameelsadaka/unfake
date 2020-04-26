import 'package:itstrue/screens/templates/CardTemplate.dart';
class CardDatas {
  final String postId;
  final String title;
  final String template;
  final String thumbnail;
  final String requesterId;
  final String requesterName;
  final String requesterTitle;
  final bool isVerified;
  final int verifiedCount;
  final List<Message> message;
  final List<String> contacts;

  CardDatas(
      {this.postId,
      this.title,
      this.template,
      this.thumbnail,
      this.requesterId,
      this.requesterName,
      this.requesterTitle,
      this.isVerified,
      this.verifiedCount,
      this.message,
      this.contacts});

  factory CardDatas.fromJson(Map<String, dynamic> json) {

    var list = json['message'] as List;
    print(list.runtimeType);
    List<Message> messageList = list.map((i) => Message.fromJson(i)).toList();
    return CardDatas(
      postId: json['postId'],
      title: json['title'],
      template: json['template'],
      thumbnail: json['thumbnail'],
      requesterId: json['requesterId'],
      requesterName: json['requesterName'],
      requesterTitle: json['requesterTitle'],
      isVerified: json['isVerified'],
      verifiedCount: json['verifiedCount'],
      contacts: json['contacts'],
      message: messageList
    );
  }
}

class Message {
  final String body;
  final String time;

  Message({this.body, this.time});
  factory Message.fromJson(Map<String, dynamic> parsedJson){
    return Message(
        body:parsedJson['body'],
        time:parsedJson['time']
    );
  }
}
