import 'package:flutter/material.dart';
import 'package:flutter_youtube_api/screens/twitterscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'githubScreen.dart';
import 'home_screen.dart';
import 'instagramscreen.dart';

class ProductTabs extends StatefulWidget {

  @override
  _ProductTabsState createState() => _ProductTabsState(   );
}

class _ProductTabsState extends State<ProductTabs> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int pageIndex = 0;
  int currentPage = 0;

  String currentTitle = "Home";
  Color currentColor = Colors.deepPurple;
  bool isAdmin = false;
//"https://www.instagram.com/codepur_ka_superhero/?hl=en"
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabView = [
      HomeScreen(),
      WebViewExample(),
      InstagramScreen(),
      GithubScreen(),
    ];
    Future<bool> _exitApp(BuildContext context) {
      return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Use In App Arrow button to Forward and Back'),
          content: new Text('We hate to see you leave...'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('No'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Yes'),
            ),
          ],
        ),
      );
    }
    return Container(
        color: Theme
            .of(context)
            .backgroundColor,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Theme
                .of(context)
                .backgroundColor,
            resizeToAvoidBottomPadding: false,
            key: _scaffoldKey,
            body: WillPopScope(
              onWillPop: () => _exitApp(context),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: _tabView,
              ),
            ),

            bottomNavigationBar: SafeArea(
              top: false,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: 62,
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              FontAwesomeIcons.youtube, size: 38, color: Colors.red)
                        ),
                      ],
                    ),
                  ),

                  Tab(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: 62,
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              FontAwesomeIcons.twitter, size: 38, color: Theme
                                .of(context)
                                .accentColor,)
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: 62,
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                              FontAwesomeIcons.instagram, size: 38, color:Colors.grey)
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Stack(
                      children: <Widget>[
                        Container(
                            width: 62,
                            padding: EdgeInsets.all(6.0),
                            child: Icon(
                                FontAwesomeIcons.github, size: 38, color:Colors.black87)
                        ),
                      ],
                    ),
                  ),
                ],
                indicator: ShapeDecoration( // if indicator is set, indicatorWeight,indicatorPadding, indicatorColor are ignored
                  color: Color(0Xff7434eb),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
                isScrollable: false,

              ),
            ),
          ),
        ));
  }
}
