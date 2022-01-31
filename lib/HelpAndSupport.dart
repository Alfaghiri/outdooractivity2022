import 'package:flutter/material.dart';
import 'Themes.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Help and Support"),
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
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "If you have a question, feel free to contact us \n",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: iconColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.email_rounded),
                                label: Text('Nouzad Mohammad'),
                                onPressed: () {
                                  launch(
                                      'mailto: nouzad.Mohammad@stud.sbg.ac.at?subject=Support');
                                },
                              ),
                              ElevatedButton.icon(
                                icon: Icon(Icons.email_rounded),
                                label: Text('Abdul Wahhab Alfaghiri Al Anzi'),
                                onPressed: () {
                                  launch(
                                      'mailto: abdul.alfaghiri-al-anzi@stud.sbg.ac.at?subject=Support');
                                },
                              ),
                            ])
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
  
