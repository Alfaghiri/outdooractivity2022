import 'package:flutter/material.dart';
import 'Themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Running.dart';

double distH = 0; // Hiking´s distance
double timeH = 0; //Hiking´s time
double kcalH = 0; //Hiking´s kilocalorie

DateTime dateToday = new DateTime.now();
String _now = dateToday.toString().substring(0, 10);

class Hiking extends StatefulWidget {
  @override
  _HikingState createState() => _HikingState();
}

class _HikingState extends State<Hiking> {
  @override
  Widget build(BuildContext context) {
    double stepsPerc = 0;
    if (todayStep != null) {
      distH = todayStep / 1984;
      timeH = todayStep / 134;
      kcalH = todayStep * 0.025;
      stepsPerc = todayStep / stepsGoal;
    }

    double distPerc = distH / distGoal;
    double timePerc = timeH / timeGoal;
    double kcalPerc = kcalH / kcalGoal;

    if (distPerc > 1) distPerc = 1;
    if (timePerc > 1) timePerc = 1;
    if (kcalPerc > 1) kcalPerc = 1;
    if (stepsPerc > 1) stepsPerc = 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Hiking"),
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
                      icon: FaIcon(FontAwesomeIcons.hiking),
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
                            distH.toStringAsFixed(2) + "\n Km",
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
                            timeH.toStringAsFixed(2) + "\n Min",
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
                            kcalH.toStringAsFixed(2) + "\n Kcal",
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
                            todayStep.toString() + "\n Steps",
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
}
