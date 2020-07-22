import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:numed/constants/color_constant.dart';
import 'package:numed/constants/style_constant.dart';

class AppointmentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return form();
  }
}

class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}

class _formState extends State<form> {
  final _minimumPadding = 5.0;
  TextEditingController userName = TextEditingController();
  TextEditingController userAge = TextEditingController();
  TextEditingController userMobileno = TextEditingController();
  TextEditingController userMessage = TextEditingController();
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mCardTitleColor,
        title: Text('Booking Form'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: mFillColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: mFillColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 45,
                              backgroundImage:
                                  AssetImage('assets/images/doctor.png'),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "sanjeev",
                                          style: mTitleStyle,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          "₹45454",
                                          style: doctorsSubtitle,
                                        ),
                                        Text(
                                          ' years of experience ',
                                          style: doctorsSubtitle,
                                        ),
                                        Text(
                                          ' designation ',
                                          style: doctorsSubtitle,
                                        ),
                                        Text(
                                          'Address:Bhubaneswar ',
                                          style: doctorsSubtitle,
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: bordercolour),
                            ),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 1.0),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Book for ",
                              style: mTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: TextField(
                  controller: userName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Your Name',
                      labelStyle: TextStyle(
                        color: mCardSubtitleColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: mCardSubtitleColor, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Row(
              children: <Widget>[
                Container(
                  width: 120.0,
                  child: Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: TextField(
                        controller: userAge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Age',
                            hintText: 'Enter Age',
                            labelStyle: TextStyle(
                              color: mCardSubtitleColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: mCardSubtitleColor, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: TextField(
                        controller: userAge,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Age',
                            hintText: 'Enter Age',
                            labelStyle: TextStyle(
                              color: mCardSubtitleColor,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: mCardSubtitleColor, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      )),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: TextField(
                  maxLines: 3,
                  controller: userMessage,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      labelText: 'Messages',
                      hintText: 'Enter Messages',
                      labelStyle: TextStyle(
                        color: mCardSubtitleColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: mCardSubtitleColor, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: RaisedButton(
                  color: mCardSubtitleColor,
                  child: Text('Book',
                      style: TextStyle(fontSize: 20, color: BackgroundColor)),
                  onPressed: () {
                    setState(() {
                      debugPrint("submit");
                    });
                  },
                )),
            Padding(
                padding: EdgeInsets.all(_minimumPadding),
                child: Text(this.displayResult)),
          ],
        ),
      ),
    );
  }
}
