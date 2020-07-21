import 'package:numed/constants/color_constant.dart';
import 'package:numed/constants/style_constant.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Doctordetails extends StatefulWidget {
  List list;
  int index;
  String btnValue;
  var finaldate = 45;

  Doctordetails({this.index, this.list, this.btnValue});

  @override
  _DoctordetailsState createState() => _DoctordetailsState();
}

class _DoctordetailsState extends State<Doctordetails> {
  String _value = 'Select Date';
  String _changeformatdate = 'Select Date';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020, 05, 05),
        lastDate: new DateTime(2021, 12, 1));

    _value = (picked.toString());
    _changeformatdate = _value.substring(0, 10);
    if (picked != null) setState(() => _changeformatdate);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: mCardTitleColor,
        title: new Text("Doctors Details"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 32,
                            backgroundImage:
                                AssetImage('assets/images/doctor.png'),
                          ),
                          Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "${widget.btnValue}",
                                        style: mTitleStyle,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        "₹${widget.list[widget.index]['price']}",
                                        style: doctorsSubtitle,
                                      ),
                                      Text(
                                        '${widget.list[widget.index]['stock']} years of experience ',
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 8.0, left: 50.0, right: 50.0),
                        child: Row(
                          children: <Widget>[
//                          Icon(
//                            Icons.video_call,
//                            color: mBlueColor,
//                            size: 40,
//                          ),
//                          Spacer(),
//                          Icon(
//                            Icons.chat,
//                            color: mBlueColor,
//                            size: 30,
//                          ),
//                          Spacer(),
//                          Icon(
//                            Icons.local_hospital,
//                            color: mBlueColor,
//                            size: 33,
//                          ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 1.0),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Book for video calling",
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
          Container(
            decoration: BoxDecoration(
              color: mFillColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: _selectDate,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 50.0,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.fromLTRB(25.0, 5.0, 40.0, 5.0),
                        margin: EdgeInsets.fromLTRB(25.0, 16.0, .0, 5.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 80.0),
                            Image.asset(
                              "assets/images/calend.png",
                              height: 28,
                              width: 28,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              _changeformatdate,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF21BFBD),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                GestureDetector(
                  onTap: ()=>debugPrint("Morning"),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.fromLTRB(25.0, 5.0, 40.0, 5.0),
                        margin: EdgeInsets.fromLTRB(25.0, 16.0, .0, 5.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/mountain (2).png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              "Morning",
                              style: TextStyle(
                                fontSize: 17.0, //   color: Color(0xFF21BFBD),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Not Available",
                              //  maxLines: 5,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: ()=>debugPrint("Afternoon"),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.fromLTRB(25.0, 5.0, 40.0, 5.0),
                        margin: EdgeInsets.fromLTRB(25.0, 16.0, .0, 5.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/sun.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              "Afternoon",
                              style: TextStyle(
                                fontSize: 17.0, //   color: Color(0xFF21BFBD),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Not Available",
                              //  maxLines: 5,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                   onTap: ()=>debugPrint("Evening"),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.fromLTRB(25.0, 5.0, 40.0, 5.0),
                        margin: EdgeInsets.fromLTRB(25.0, 16.0, .0, 5.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/images/day-and-night.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 15.0),
                            Text(
                              "Evening",
                              style: TextStyle(
                                fontSize: 17.0, //   color: Color(0xFF21BFBD),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Not Available",
                              //  maxLines: 5,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
