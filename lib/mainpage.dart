import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/Main/Booking.dart';
import 'package:icarehotel/Main/CheckIn.dart';
import 'package:icarehotel/Main/Home.dart';
import 'package:icarehotel/Main/MessageBox.dart';
import 'package:icarehotel/Main/Setting.dart';
import 'package:icarehotel/color.dart';
import 'package:icarehotel/shared/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key key}) : super(key: key);

  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  ShapeBorder customBottomBarShape1 = BeveledRectangleBorder(
      // borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),)
      );
  int _currentIndex = 2;
  SnakeBarStyle snakeBarStyle = SnakeBarStyle.floating;
  SnakeShape snakeShape = SnakeShape.circle;
  ShapeBorder bottomBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)));
  double elevation = 0;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color backgroundColor = Colors.white;
  Color selectionColor = Colors.black;
  final Home home = Home();
  final Booking booking = Booking();
  final CheckIn checkIn = CheckIn();
  final MessageBox messageBox = MessageBox();
  final Setting setting = Setting();

  checkLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Const.uid = sharedPreferences.getString('uid');
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  String pagename;
  Widget _showPage = Home();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return booking;
        break;
      case 1:
        return checkIn;
        break;
      case 2:
        return home;
        break;
      case 3:
        return messageBox;
        break;
      case 4:
        return setting;
        break;
      default:
        return new Container(
          child: Center(
            child: Text("No page found by page chooser.",
                style: TextStyle(fontSize: 30)),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: _showPage,
          bottomNavigationBar: SnakeNavigationBar(
            style: SnakeBarStyle.pinned,
            snakeShape: SnakeShape.rectangle,
            snakeColor: ColorTheme.gold,
            backgroundColor: ColorTheme.secondTheme,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            shape: customBottomBarShape1,
            padding: EdgeInsets.zero,
            currentIndex: _currentIndex,
            onPositionChanged: (index) => setState(() {
              _currentIndex = index;
              _showPage = _pageChooser(index);
            }),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.date_range),
                  title: Text("Booking", style: GoogleFonts.k2d(fontSize: 10))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.playlist_add_check),
                  title: Text("CheckIn", style: GoogleFonts.k2d(fontSize: 10))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home", style: GoogleFonts.k2d(fontSize: 10))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text("Message", style: GoogleFonts.k2d(fontSize: 10))),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Setting", style: GoogleFonts.k2d(fontSize: 10)))
            ],
          ),
        ),
      ),
    );
  }
}
