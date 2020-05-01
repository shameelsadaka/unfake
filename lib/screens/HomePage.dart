import 'package:flutter/material.dart';
import 'package:itstrue/data/class/CardModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itstrue/screens/components/MiniCard.dart';

//Components
import '../data/logic/controller.dart';
import 'components/HomeCarousel.dart';
import 'package:itstrue/data/logic/controller.dart';

bool isEmpty(String s) => s == null || s.isEmpty;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FocusNode _searchBoxFocus = new FocusNode();

  bool _isSearching;
  String _searchString;
  bool _searchLoading = false;
  CardModel _searchResult;
  final _searchBoxController = TextEditingController();

  final data = DataHandler();

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    _searchBoxFocus.addListener(_onSearchBoxFocusChange);
    _searchString = null;
    _searchBoxController.addListener(_updateSearchString);
  }


  void _onSearchBoxFocusChange(){
    setState(() {
      _isSearching = _searchBoxFocus.hasFocus || !isEmpty(_searchString);
    });
  }

  void _updateSearchString(){
    String newSearch =_searchBoxController.text;
    setState((){
      _searchString = newSearch;
      _searchResult = null;
    });
  }

  void _searchCard(){
      setState(() {
        _searchLoading = true;
      });

      data.searchCard(_searchString.toUpperCase()).then((CardModel post){
        if(post != null){
          _searchResult = post;
        }
        else{
            Fluttertoast.showToast(
              msg: "Post Not Found",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 5,
              gravity: ToastGravity.CENTER,
            );
        }
      }).catchError((e){
        Fluttertoast.showToast(
          msg: "Unable to search for the post.\n Check your internet",
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 5,
          gravity: ToastGravity.CENTER,
        );
      }).whenComplete((){
        setState(() {
          _searchLoading = false;
        });
      });        
  }

  void _clearSearchBox(){
    _searchBoxController.clear();
    _searchBoxFocus.requestFocus();
  }

  Future<bool> _unfocusSearchBox(){
    if(_isSearching){
      print(_searchString);
      _searchBoxFocus.unfocus();
      _searchBoxController.clear();
      setState(() {
        _isSearching = false;
      });
      return Future<bool>.value(false);
    }
    else{
      return Future<bool>.value(true);
    }
  }



  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: _unfocusSearchBox,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),


          // Search Box
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                        focusNode: _searchBoxFocus,
                        controller: _searchBoxController,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for Posts',
                        )
                    ),
                  ),
                  (
                      isEmpty(_searchString)?
                      Icon(Icons.search):
                      IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: _clearSearchBox,
                      )
                  )
                ],
              ),
            ),
          ),




          // Search Results
          Visibility(
            visible:  _isSearching,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: (
                  _searchString == ""?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Enter Complete Post ID to search',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0
                          ),
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: FlatButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.cancel,size: 25,color: Colors.grey[400]),
                                  Text("Cancel",style: TextStyle(color: Colors.grey[400])),
                                ],
                              ) ,
                              onPressed: _unfocusSearchBox
                          ),
                        ),


                      ],
                    ),
                  )
                      :
                  Container(
                      margin: EdgeInsets.only(top:30),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            if(_searchLoading == true)
                              Padding(
                                padding: const EdgeInsets.only(top:30.0),
                                child: CircularProgressIndicator(strokeWidth: 2,valueColor: new AlwaysStoppedAnimation<Color>(Colors.green)),
                              )
                            else
                            (
                              _searchResult != null?
                              MiniCard(cardData: _searchResult)
                              :
                              FlatButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.green)
                                ),
                                onPressed: _searchCard,
                                child: const Text(
                                    'GO',
                                    style: TextStyle(fontSize: 20)
                                ),

                              )
                            )

                          ],

                        ),
                      )
                  )
              ),
            ),
          ),


          // Card List
          Visibility(
            visible:  !_isSearching,
            child:Container(
                margin: EdgeInsets.only(top:15),
                alignment: Alignment.center,
                child: HomeCarousel()
            ),
          )



        ],
      ),
    );
  }



  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _searchBoxFocus.dispose();
    _searchBoxController.dispose();
    super.dispose();
  }
}
