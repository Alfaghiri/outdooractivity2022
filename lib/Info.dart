import 'package:flutter/material.dart';
import 'Themes.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Outdoor Activity"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: theme,
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          )),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                            height: 200,
                            child: Image.asset(
                              "assets/logo.png",
                              fit: BoxFit.contain,
                            )),
                        Divider(height: 30, color: Colors.transparent),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 20,
                                    height: 2,
                                    color: iconColor,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                      text:
                                          "Outdoor Activity counts your steps using the built-in sensor and also tracks your burned calories, distance traveled and time."),
                                  TextSpan(
                                      text: "oals can also be easily set."),
                                  TextSpan(
                                      text:
                                          "With the app you can find Salzburg-wide tours and plan your own routes with ease."),
                                  TextSpan(
                                      text:
                                          "Just put your smartphone in your pocket and off you go!")
                                ]))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

  // login function
  
