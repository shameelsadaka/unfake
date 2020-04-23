import 'package:flutter/material.dart';

//Components
import 'components/HomeCarousel.dart';
import 'components/BottomNavBar.dart';


bool isEmpty(String s) => s == null || s.isEmpty;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FocusNode _searchBoxFocus = new FocusNode();
  
  bool _isSearching;
  String _searchString;
  final _searchBoxController = TextEditingController();


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
    });


    // Handle Search Requests
    ///
    ///
    ///
    ///   Handle Search Resutls Here
    ///
    ///
    ///
    ///
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
    
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: WillPopScope(
          onWillPop: _unfocusSearchBox,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[




              // Header
  
              Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/unfake-logo.png'),
                      height: 25.0,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    )
                  ],
                ),
              ),


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
                            'Enter Post Unique ID to search',
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
                        child: CircularProgressIndicator(strokeWidth: 2,valueColor: new AlwaysStoppedAnimation<Color>(Colors.green))
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
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Create New Post',
        child: Icon(Icons.add, size: 30.0),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
