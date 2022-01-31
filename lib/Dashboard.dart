import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

DateTime dateToday = new DateTime.now();
String _now = dateToday.toString().substring(0, 10);
int allsteps; //all steps
double totalDist; // total distance of Running
double totalTime; // total time of Running
double totalKcal; // total kilocalorie of Running
double totalDistH; // total distance of Hiking
double totalTimeH; // total time of Hiking
double totalKcalH; // total kilocalorie of Hiking

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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

      setState(() {
        allsteps = loggedInUser.allSteps; //all steps from Database
        totalDist = loggedInUser.rDist; //total Running´s distance from Database
        totalKcal =
            loggedInUser.rKcal; //total Running´s kilocalorie from Database
        totalTime = loggedInUser.rMin; //total Running´s time from Database
        totalDistH =
            loggedInUser.hDist; //total Hiking´s diistance from Database
        totalKcalH =
            loggedInUser.hKcal; //total Hiking´s kilocalorie from Database
        totalTimeH = loggedInUser.hMin; //total Hiking´s time from Database
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: theme,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                _now,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Divider(
                height: 30,
                color: Colors.transparent,
              ),
              Center(
                  child: SizedBox.fromSize(
                size: Size(150, 150), // button width and height
                child: ClipOval(
                  child: Material(
                    color: themeColor, // button color
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        IconButton(
                          icon: FaIcon(FontAwesomeIcons.shoePrints),
                          iconSize: 50,
                          color: iconColor,
                          onPressed: () {},
                        ),
                        Text(
                          "${loggedInUser.allSteps} \n Steps",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: iconColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        // icon
                      ],
                    ),
                  ),
                ),
              )),
              Divider(
                height: 10,
                color: Colors.transparent,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                  Widget>[
                Column(children: <Widget>[
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(120, 120), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.running),
                              iconSize: 50,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              "RUNNING",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),

                  /////////////////////Distance///////////////////////////////
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(100, 100), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.mapMarked),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              loggedInUser.rDist.toStringAsFixed(2) + "\n Km",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),
                  /////////////////Time/////////////////////////////////
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(100, 100), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.clock),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              loggedInUser.rMin.toStringAsFixed(2) + "\n Min",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),
                  //////////////////////////////Kcal//////////////////
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(100, 100), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.fire),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              loggedInUser.rKcal.toStringAsFixed(2) + "\n Kcal",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                ]),
                Divider(
                  color: Colors.transparent,
                ),
                //////////////////////
                ////////////////////////HIKING/////////////////////////////////
                Column(children: <Widget>[
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(120, 120), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.hiking),
                              iconSize: 50,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              "HIKING",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),
                  /////////////////////////Distance//////////////////////////
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(100, 100), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.mapMarked),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              loggedInUser.hDist.toStringAsFixed(2) + "\n Km",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),
                  ////////////////////Time//////////////////////////////
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(100, 100), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.clock),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              loggedInUser.hMin.toStringAsFixed(2) + "\n Min",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                  Divider(
                    color: Colors.transparent,
                  ),
                  //////////////////////////Kcal//////////////////////////////////
                  Center(
                      child: SizedBox.fromSize(
                    size: Size(100, 100), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: themeColor, // button color
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.fire),
                              iconSize: 30,
                              color: iconColor,
                              onPressed: () {},
                            ),
                            // icon
                            Text(
                              loggedInUser.hKcal.toStringAsFixed(2) + "\n Kcal",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: iconColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ), // text
                          ],
                        ),
                      ),
                    ),
                  )),
                ]),
              ]),
            ],
          )),
    );
  }
}
