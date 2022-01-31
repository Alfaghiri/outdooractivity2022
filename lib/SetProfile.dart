// ignore_for_file: prefer_const_constructors, file_names, deprecated_member_use

import 'UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
String userId = (FirebaseAuth.instance.currentUser).uid;

// ignore: use_key_in_widget_constructors
class SetProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SetProfileState();
  }
}

class SetProfileState extends State<SetProfile> {
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

  final fName = TextEditingController();
  final sName = TextEditingController();
  final eMail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Set Profile"),
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
////////////////////////////// First Name////////////////////
                  TextFormField(
                      controller: fName,
                      keyboardType: TextInputType.name,
                      inputFormatters: <TextInputFormatter>[],
                      decoration: InputDecoration(
                          labelText: "first name",
                          hintText: "edit your first name",
                          icon: Icon(Icons.account_circle))),
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
                          firestore
                              .collection("users")
                              .doc(userId)
                              .update({"firstName": fName.text});
                          fName.clear();
                        },
                        child: Text(
                          "edit",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),

                  /////////////////////////////// Second Name /////////////////////////
                  TextFormField(
                      controller: sName,
                      keyboardType: TextInputType.name,
                      inputFormatters: <TextInputFormatter>[],
                      decoration: InputDecoration(
                          labelText: "second name",
                          hintText: "edit your second name",
                          icon: Icon(Icons.account_circle))),
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
                          firestore
                              .collection("users")
                              .doc(userId)
                              .update({"secondName": sName.text});
                          sName.clear();
                        },
                        child: Text(
                          "edit",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),
                  /////////////////////////////// Email //////////////////////////////////
                  TextFormField(
                      controller: eMail,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: <TextInputFormatter>[],
                      decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "edit your Email",
                          icon: Icon(Icons.email_rounded))),
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
                          firestore
                              .collection("users")
                              .doc(userId)
                              .update({"email": eMail.text});
                          eMail.clear();
                        },
                        child: Text(
                          "edit",
                          style: TextStyle(
                              color: theme[0],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      )),

                  ////////////////////////// Steps //////////////////////////
                ]),
          ),
        ),
      ),
    );
  }
}
