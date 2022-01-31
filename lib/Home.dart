// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use

import 'Hiking.dart';
import 'HikingDataView.dart';
import 'Running.dart';
import 'Dashboard.dart';
import 'HelpAndSupport.dart';
import 'Info.dart';
import 'LoginScreen.dart';
import 'SetProfile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Themes.dart';
import 'UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Setting.dart';

int _index = 0; // this is the index of selected theme

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("email");
    Fluttertoast.showToast(msg: "Log out Successfuly");
    Get.to(LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    // to change the current theme
    switch (_index) {
      case 0:
        theme = Themes().theme1;
        themeColor = Themes().theme1[0];
        iconColor = Themes().theme1[1];
        percentColor = Colors.black;

        break;

      case 1:
        theme = Themes().theme2;
        themeColor = Themes().theme2[0];
        iconColor = Themes().theme2[1];
        percentColor = Colors.black;
        break;
      case 2:
        theme = Themes().theme3;
        themeColor = Themes().theme3[0];
        iconColor = Themes().theme3[1];
        percentColor = Colors.black;
        break;
      case 3:
        theme = Themes().theme4;
        themeColor = Themes().theme4[0];
        iconColor = Themes().theme4[1];
        percentColor = Colors.black;
        break;
      case 4:
        theme = Themes().theme5;
        themeColor = Themes().theme5[0];
        iconColor = Themes().theme5[1];
        percentColor = Colors.yellow;

        break;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Outdoor Activity"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(HikingDataView());
              },
              icon: Icon(FontAwesomeIcons.hiking)),
          IconButton(
              onPressed: () {
                Get.to(Info());
              },
              icon: Icon(FontAwesomeIcons.infoCircle)),
        ],
      ),
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: theme,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        )),
        child: ListView(children: <Widget>[
          Divider(
            height: 30,
            color: Colors.transparent,
          ),
          Text(
            "${loggedInUser.firstName} ${loggedInUser.secondName}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: themeColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(
            height: 10,
            color: Colors.transparent,
          ),
          Text("${loggedInUser.email}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: themeColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Divider(
            height: 30,
            color: Colors.transparent,
          ),
          ListTile(
            title: Text(
              "Dashboard",
              style: TextStyle(
                  fontSize: 18, color: themeColor, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.home, color: themeColor),
            onTap: () {
              Get.to(Dashboard());
            },
          ),
          ListTile(
            title: Text(
              "Profile",
              style: TextStyle(
                  fontSize: 18, color: themeColor, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.person, color: themeColor),
            onTap: () {
              Get.to(SetProfile());
            },
          ),
          ListTile(
            title: Text(
              "Settings",
              style: TextStyle(
                  fontSize: 18, color: themeColor, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.settings, color: themeColor),
            onTap: () {
              Get.to(Setting());
            },
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                  child: Column(
                children: <Widget>[
                  Divider(
                    height: 350,
                    color: Colors.transparent,
                  ),
                  ListTile(
                    leading: Icon(Icons.help, color: iconColor),
                    title: Text(
                      'Help and Support',
                      style: TextStyle(
                          fontSize: 18,
                          color: iconColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Get.to(Help());
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: iconColor),
                    title: Text(
                      'Log out',
                      style: TextStyle(
                          fontSize: 18,
                          color: iconColor,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      logOut(context);
                    },
                  )
                ],
              ))),
        ]),
      )),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: theme,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(220, 220), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.running),
                              iconSize: 120,
                              color: iconColor,
                              onPressed: () {
                                Get.to(Running());
                              },
                            ),
                            // icon
                            Text(
                              "RUNNING",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    height: 80,
                    color: Colors.transparent,
                  ),
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(220, 220), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.hiking),
                              iconSize: 120,
                              color: iconColor,
                              onPressed: () {
                                Get.to(Hiking());
                              },
                            ),
                            // icon
                            Text(
                              "HIKING",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),
                ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: themeColor.withOpacity(0.8),
          elevation: 0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.theater_comedy_rounded,
                color: Colors.blueAccent,
              ),
              title: Text('Theme1'),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.theater_comedy_rounded,
                  color: Colors.redAccent,
                ),
                title: Text('Theme2')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.theater_comedy_rounded,
                  color: Colors.blue,
                ),
                title: Text('Theme3')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.theater_comedy_rounded,
                  color: Colors.amberAccent,
                ),
                title: Text('Theme4')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.theater_comedy_rounded,
                  color: Colors.black,
                ),
                title: Text('Theme5'))
          ],
          currentIndex: _index,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
