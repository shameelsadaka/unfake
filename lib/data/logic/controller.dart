import 'dart:ui' as ui;
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:itstrue/data/class/CardModel.dart';
import 'package:itstrue/data/logic/firebase.dart';

class DataHandler {
  final _auth = FireBaseUser();
  Future<bool> loginStatus() async {
    return await _auth.loginStatus();
  }

  Future<String> getUserName() async {
    return _auth.getUserName();
  }

  Future<String> getUserUid() async {
    return _auth.userUid();
  }

  signOut() {
    _auth.signOut();
  }

  createCard(title, body, template, thumbnail,phone1,phone2) {
    //Generate Post ID and Card ID
    var isVerified = false;
    //timestamp
    int timeStamp = new DateTime.now().millisecondsSinceEpoch;
    //unique id generation using timestamp and random integer
    var rng = new Random();
    String uuid = '${timeStamp.toString()}${rng.nextInt(9).toString()}';
    int uid = int.parse(uuid);

    //Generate Post ID
    String alpha = randomAlpha(3).toUpperCase();
    String num = randomBetween(1, 9999).toString();
    String alphanumeric = alpha + num;

    //Passing datas to Firebase Function Class
    _auth.cardData(timeStamp, title, uid, alphanumeric, isVerified, template,
        thumbnail, body,phone1,phone2);
  }

  Future<List<CardModel>> getAllData() {
    return _auth.getCardData();
  }

  Future updateCard(postid, body) {
    return _auth.updateCard(postid, body);
  }

  Future<CardModel> getCardFromId(String postId) {
    return _auth.getCardFromId(postId);
  }


  Future<List<CardModel>> getUserPosts() {
    return _auth.getUserCards();
  }

  //
  //
  //

  static Future<Uint8List> createImageFromWidget(Widget widget,
      {Duration wait, Size logicalSize, Size imageSize}) async {
    final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

    logicalSize ??= ui.window.physicalSize / ui.window.devicePixelRatio;
    imageSize ??= ui.window.physicalSize;

    assert(logicalSize.aspectRatio == imageSize.aspectRatio);

    final RenderView renderView = RenderView(
      window: null,
      child: RenderPositionedBox(
          alignment: Alignment.center, child: repaintBoundary),
      configuration: ViewConfiguration(
        size: logicalSize,
        devicePixelRatio: 1.0,
      ),
    );

    final PipelineOwner pipelineOwner = PipelineOwner();
    final BuildOwner buildOwner = BuildOwner();

    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final RenderObjectToWidgetElement<RenderBox> rootElement =
        RenderObjectToWidgetAdapter<RenderBox>(
            container: repaintBoundary,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: widget,
            )).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);

    if (wait != null) {
      await Future.delayed(wait);
    }

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();

    pipelineOwner.flushLayout();
    pipelineOwner.flushCompositingBits();
    pipelineOwner.flushPaint();

    final ui.Image image = await repaintBoundary.toImage(
        pixelRatio: imageSize.width / logicalSize.width);
    final ByteData byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);

    return byteData.buffer.asUint8List();
  }
  
  Future<List> getSavedPosts() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List savedposts =  (prefs.getStringList('saved_posts') ?? []);
    return savedposts;
  }

  Future savePostLocally(postid) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedposts =  (prefs.getStringList('saved_posts') ?? []);

    if(!savedposts.contains(postid))
      savedposts.add(postid);
    return prefs.setStringList('saved_posts', savedposts);
  }
  
}
