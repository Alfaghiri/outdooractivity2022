// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use

import 'Running.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'themes.dart';

int _index = 0;
String disgoal = "8";
String timegoal = "40";
String kcalgoal = "240";
String stepgoal = "6000";

// ignore: use_key_in_widget_constructors
class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SettingState();
  }
}

class SettingState extends State<Setting> {
  final _dgoal = TextEditingController();
  final _tgoal = TextEditingController();
  final _kgoal = TextEditingController();
  final _sgoal = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: theme,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          padding: EdgeInsets.only(top: 80, left: 40, right: 40),
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
////////////////////////////// Distance goal////////////////////
                  TextFormField(
                      controller: _dgoal,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                          labelText: "distance´s goal",
                          hintText: "set your distance´s goal",
                          icon: Icon(FontAwesomeIcons.mapMarked))),

                  Text(
                    "current goal   " + disgoal,
                    style: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),

                  Divider(color: Colors.transparent),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(theme[1]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          setState(() {
                            _dgoal;
                            distGoal = int.parse(_dgoal.text);
                            disgoal = _dgoal.text;
                          });
                          _dgoal.clear();
                        },
                        child: Text(
                          "Set",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),

                  /////////////////////////////// Time goal /////////////////////////
                  TextFormField(
                      controller: _tgoal,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                          labelText: "time´s goal",
                          hintText: "set your time´s goal",
                          icon: Icon(FontAwesomeIcons.clock))),

                  Text(
                    "current goal   " + timegoal,
                    style: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),

                  Divider(color: Colors.transparent),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(theme[1]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          setState(() {
                            _tgoal;
                            timeGoal = int.parse(_tgoal.text);
                            timegoal = _tgoal.text;
                          });
                          _tgoal.clear();
                        },
                        child: Text(
                          "Set",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),
                  /////////////////////////////// Kcal //////////////////////////////////
                  TextFormField(
                      controller: _kgoal,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                          labelText: "Kcal´s goal",
                          hintText: "set your Kcal´s goal",
                          icon: Icon(FontAwesomeIcons.fire))),

                  Text(
                    "current goal   " + kcalgoal,
                    style: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),

                  Divider(color: Colors.transparent),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(theme[1]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          setState(() {
                            _kgoal;
                            kcalGoal = int.parse(_kgoal.text);
                            kcalgoal = _kgoal.text;
                          });
                          _kgoal.clear();
                        },
                        child: Text(
                          "Set",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),

                  ////////////////////////// Steps //////////////////////////
                  TextFormField(
                      controller: _sgoal,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      decoration: InputDecoration(
                          labelText: "steps´s goal",
                          hintText: "set your steps´s goal",
                          icon: Icon(FontAwesomeIcons.shoePrints))),

                  Text(
                    "current goal   " + stepgoal,
                    style: TextStyle(
                        color: iconColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),

                  Divider(color: Colors.transparent),
                  SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(theme[1]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {
                          setState(() {
                            _sgoal;
                            stepsGoal = int.parse(_sgoal.text);
                            stepgoal = _sgoal.text;
                          });
                          _sgoal.clear();
                        },
                        child: Text(
                          "Set",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
