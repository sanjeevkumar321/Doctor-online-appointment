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
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Available Today",
                              style: sTitleStyle,
                            ),
                            Spacer(),
                            RaisedButton(
                              color: mCardTitleColor,
                              onPressed: () => debugPrint("abc"),
//                            Navigator.of(context).push(
//                                MaterialPageRoute(
//                                    builder: (BuildContext context) =>
//                                        Doctordetails(
//                                          index: i,
//                                          list: list,
//                                          btnValue: getBtnvalue,
//                                        ))),
                              child: Text(
                                "Book",
                                style: TextStyle(color: BackgroundColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
