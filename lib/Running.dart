import 'dart:async';
import 'SetProfile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'Themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Hiking.dart';
import 'Dashboard.dart';

int todayStep = 0;
int distGoal = 8;
int timeGoal = 40;
int kcalGoal = 240;
int stepsGoal = 6000;
double dist = 0;
double time = 0;
double kcal = 0;

DateTime dateToday = new DateTime.now();
String _now = dateToday.toString().substring(0, 10);

class Running extends StatefulWidget {
  @override
  _RunningState createState() => _RunningState();
}

class _RunningState extends State<Running> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  Box<int> stepsBox = Hive.box('steps');
  int todaySteps;

  @override
  void initState() {
    super.initState();
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    double stepsPerc = 0;
    if (todaySteps != null) {
      dist = todaySteps / 1295;
      time = todaySteps / 153;
      kcal = todaySteps * 0.04;
      stepsPerc = todaySteps / stepsGoal;
    }
    double distPerc = dist / distGoal;
    double timePerc = time / timeGoal;
    double kcalPerc = kcal / kcalGoal;
    int lastDaySavedKey = 888888;
    int lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);
    if (lastDaySaved < todayDayNo) {
      lastDaySaved = todayDayNo;
      setState(() {
        totalDist += dist;
        totalTime += time;
        totalKcal += kcal;
        totalDistH += distH;
        totalTimeH += timeH;
        totalKcalH += kcalH;
      });
    }

    if (distPerc > 1) distPerc = 1;
    if (timePerc > 1) timePerc = 1;
    if (kcalPerc > 1) kcalPerc = 1;
    if (stepsPerc > 1) stepsPerc = 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Running"),
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
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      _now,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: iconColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.running),
                      iconSize: 120,
                      color: iconColor,
                      onPressed: () {},
                    ),
                  ]),
              Divider(
                height: 100,
                color: Colors.transparent,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ///////////////////// Distance /////////////////////
                    ///
                    ///

                    new CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 15.0,
                      percent: distPerc,
                      center: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (distPerc * 100).toStringAsFixed(0) + " %",
                            style: TextStyle(
                                color: percentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.mapMarked),
                            iconSize: 30,
                            color: iconColor,
                            onPressed: () {},
                          ),
                          Text(
                            dist.toStringAsFixed(2) + "\n Km",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: iconColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),

                          // icon
                        ],
                      )),
                      backgroundColor: themeColor,
                      progressColor: iconColor,
                    ),
                    ///////////////////// Time /////////////////////
                    new CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 15.0,
                      percent: timePerc,
                      center: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (timePerc * 100).toStringAsFixed(0) + " %",
                            style: TextStyle(
                                color: percentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.clock),
                            iconSize: 30,
                            color: iconColor,
                            onPressed: () {},
                          ),
                          Text(
                            time.toStringAsFixed(2) + "\n Min",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: iconColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),

                          // icon
                        ],
                      )),
                      backgroundColor: themeColor,
                      progressColor: iconColor,
                    ),
                  ]),
              Divider(
                height: 100,
                color: Colors.transparent,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ///////////////////// Calorie /////////////////////
                    new CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 15.0,
                      percent: kcalPerc,
                      center: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (kcalPerc * 100).toStringAsFixed(0) + " %",
                            style: TextStyle(
                                color: percentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.fire),
                            iconSize: 30,
                            color: iconColor,
                            onPressed: () {},
                          ),
                          Text(
                            kcal.toStringAsFixed(2) + "\n Kcal",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: iconColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),

                          // icon
                        ],
                      )),
                      backgroundColor: themeColor,
                      progressColor: iconColor,
                    ),
                    ///////////////////// Steps /////////////////////
                    new CircularPercentIndicator(
                      radius: 120.0,
                      lineWidth: 15.0,
                      percent: stepsPerc,
                      center: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (stepsPerc * 100).toStringAsFixed(0) + " %",
                            style: TextStyle(
                                color: percentColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.shoePrints),
                            iconSize: 30,
                            color: iconColor,
                            onPressed: () {},
                          ),
                          Text(
                            todaySteps.toString() + "\n Steps",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: iconColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),

                          // icon
                        ],
                      )),
                      backgroundColor: themeColor,
                      progressColor: iconColor,
                    ),
                  ]),
            ],
          )),
    );
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  void startListening() {
    _pedometer = Pedometer();
    _subscription = _pedometer.pedometerStream.listen(
      getTodaySteps,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }

  void _onDone() => print("Finished pedometer tracking");
  void _onError(error) => print("Flutter Pedometer Error: $error");

  Future<int> getTodaySteps(int value) async {
    print(value);
    int savedStepsCountKey = 999999;
    int savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);
    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;

    if (value < savedStepsCount) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);
    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved < todayDayNo) {
      lastDaySaved = todayDayNo;
      setState(() {
        allsteps += todayStep;
      });
      firestore.collection("users").doc(userId).update(
        {
          "allSteps": allsteps,
          "rDist": totalDist,
          "rMin": totalTime,
          "rKcal": totalKcal,
          "hDist": totalDistH,
          "hMin": totalTimeH,
          "hKcal": totalKcalH
        },
      );
      savedStepsCount = value;
      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount;
      todayStep = todaySteps;
    });
    stepsBox.put(todayDayNo, todaySteps);

    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }
}
