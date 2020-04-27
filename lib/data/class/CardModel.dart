import 'package:itstrue/screens/templates/CardTemplate.dart';

class CardModel {
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

  CardTemplate get cardTemplate {
    return CardTemplate.fromColor(template);
  }

  CardModel({
      this.postId,
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

  factory CardModel.fromJson(var json) {
    Map<String, dynamic> parsedJson = Map<String, dynamic>.from(json);
    return CardModel(
        postId: parsedJson['postId'],
        title: parsedJson['title'],
        template: parsedJson['template'],
        thumbnail: parsedJson['thumbnail'],
        requesterId: parsedJson['requesterId'],
        requesterName: parsedJson['requesterName'],
        requesterTitle: parsedJson['requesterTitle'],
        isVerified: parsedJson['isVerified'],
        verifiedCount: parsedJson['verifiedCount'],
        contacts: new List<String>.from(parsedJson['contacts']),
        message: parseMessages(json['messages'])
    );
  }

  static List<Message> parseMessages(messagesJson){
    var list  = messagesJson as List;
    List<Message> messageList = list.map((data)=>Message.fromJson(data)).toList();
    return messageList;
  }
}

class Message {
  final String body;
  final int time;

  Message({this.body, this.time});

  factory Message.fromJson(var json) {
    Map<String, dynamic> parsedJson = Map<String, dynamic>.from(json);
    return Message(body: parsedJson['body'], time: parsedJson['time']);
  }
}
