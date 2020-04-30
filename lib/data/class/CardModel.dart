import 'package:intl/intl.dart';
import 'package:itstrue/screens/templates/CardTemplate.dart';

enum CardStatus {open,closed,deleted,important,blocked,fake,reported}

class CardModel {
  final String postId;
  final String title;
  final String template;
  final String thumbnail;
  final String requesterId;
  final String requesterName;
  final String requesterTitle;
  final bool isVerified;
  final String verification;
  final int verifiedCount;
  final List<CardMessage> messages;
  final List<String> contacts;
  final CardStatus cardStatus;

  
  


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
    this.verification,
    this.verifiedCount,
    this.messages,
    this.contacts,
    this.cardStatus
  });

  factory CardModel.fromJson(var json) {
    Map<String, dynamic> parsedJson = Map<String, dynamic>.from(json);
    CardStatus _cardStatus = CardStatus.open;
    
    CardStatus.values.forEach((e){
      if (e.toString() == parsedJson['cardStatus']) {
        _cardStatus = e;
      }
    });


    return CardModel(
        postId: parsedJson['postId'],
        title: parsedJson['title'],
        template: parsedJson['template'],
        thumbnail: parsedJson['thumbnail'],
        requesterId: parsedJson['requesterId'],
        requesterName: parsedJson['requesterName'],
        requesterTitle: parsedJson['requesterTitle'],
        isVerified: parsedJson['isVerified'],
        verification: parsedJson['verification'],
        verifiedCount: parsedJson['verifiedCount'],
        contacts: new List<String>.from(parsedJson['contacts']),
        messages: parseMessages(json['messages']),
        cardStatus: _cardStatus
    );
  }

  static List<CardMessage> parseMessages(messagesJson){
    var list  = messagesJson as List;
    List<CardMessage> messageList = list.map((data)=>CardMessage.fromJson(data)).toList();
    return messageList;
  }
  
  String get thumbAddress{
    return 'assets/images/icons/'+this.thumbnail;
  }
}

class CardMessage {
  final String body;
  final int timestamp;
  DateTime dateTime;
  String get date{
    return DateFormat("dd MMMM yyyy").format(dateTime).toUpperCase();
  }   
  String get time{
    return DateFormat("hh:mm a").format(dateTime);
  }   

  CardMessage({this.body, this.timestamp}){
    this.dateTime = DateTime.fromMillisecondsSinceEpoch(this.timestamp);
  }

  factory CardMessage.fromJson(var json) {
    Map<String, dynamic> parsedJson = Map<String, dynamic>.from(json);
    return CardMessage(body: parsedJson['body'], timestamp: parsedJson['time']);
  }
}
