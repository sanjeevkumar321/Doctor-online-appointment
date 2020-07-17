import 'package:numed/constants/color_constant.dart';
import 'package:numed/constants/style_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Detail extends StatefulWidget {
  List list;
  int index;
  var finaldate = 45;

  Detail({this.index, this.list});

  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "https://technogenr.com/flutter_test/getdata.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Ready to Book Dr. '${widget.list[widget.index]['item_name']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "Confirm!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Color(0xFF21BFBD),
          //        onPressed: (){
          //          deleteData();
          //          Navigator.of(context).push(
          //            new MaterialPageRoute(
          //              builder: (BuildContext context)=> new Home(),
          //            )
          //          );
          //        },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.red,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

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
//      appBar: AppBar(
//      //  backgroundColor: mBackgroundColor,
//        title: Image.asset('assets/images/technogenr.png', fit: BoxFit.cover),
//        elevation: 0,
//      ),
//      appBar: new AppBar(title: new Text("${widget.list[widget.index]['item_name']}")),
      backgroundColor: Color(0xffF8F8FA),
      body: ListView(
        // overflow: Overflow.visible,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Color(0xFF21BFBD),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                    width: 225.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Select Slot ',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color(0xFF393939),
                                //    fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),

            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFD6D6D6)),
              borderRadius: BorderRadius.circular(7.0),
            ),
            // color:Color(0xFF4DD0E1),

            height: 215,
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 7.0, top: 10),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(1.0, 14.0, 5.0, 10.0),
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/doctor.png"))),
                      ),
                      SizedBox(width: 2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(3.0, 0.0, 1.0, 5.0),
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                            child: Text(
                              "${widget.list[widget.index]['item_name']}",
                              style: TextStyle(
                                  color: Color(0xFF21BFBD),
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.fromLTRB(0.0, .0, 1.0, 5.0),
                                child: Text(
                                  "  ${widget.list[widget.index]['stock']} years of experience ",
                                  //   maxLines: 5,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "MBBS,PGDD (Diabetes)      ",
                                    //  maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Address: Bhubaneswar      ",
                                    //  maxLines: 5,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 20.0, 5.0, 5.0),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          // onTap:color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 5.0),
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(7.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/hospital.png",
                                            height: 18,
                                            width: 18,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            "₹${widget.list[widget.index]['price']}",
                                            style: TextStyle(
                                              fontSize: 12.0,
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
                        ),
                        SizedBox(width: 26.0),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 10.0, 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/comment.png",
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "₹${widget.list[widget.index]['price']}",
                                          style: TextStyle(
                                            fontSize: 12.0,
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
                        SizedBox(width: 26.0),
                        Row(
                          children: <Widget>[
//                              padding: EdgeInsets.all(5.0),
//                              width: 60.0,
//                              decoration: BoxDecoration(
//                                color: Theme.of(context).accentColor,
//                                borderRadius: BorderRadius.circular(10.0),
//                              ),
//                              alignment: Alignment.center,
                            GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        10.0, 5.0, 10.0, 5.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(7.0),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/vchat.png",
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "₹${widget.list[widget.index]['price']}",
                                          style: TextStyle(
                                            fontSize: 12.0,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _selectDate,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.fromLTRB(40.0, 5.0, 40.0, 5.0),
                  margin: EdgeInsets.fromLTRB(.0, 16.0, .0, .0),
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
            // onTap: _selectDate,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.fromLTRB(22.0, 5.0, 40.0, 5.0),
                  margin: EdgeInsets.fromLTRB(.0, 7.0, .0, .0),
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
                      SizedBox(width: 42.0),
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
            // onTap: _selectDate,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.fromLTRB(22.0, 5.0, 40.0, 5.0),
                  margin: EdgeInsets.fromLTRB(.0, 7.0, .0, .0),
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
                      SizedBox(width: 29.0),
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
            // onTap: _selectDate,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.fromLTRB(22.0, 5.0, 40.0, 5.0),
                  margin: EdgeInsets.fromLTRB(.0, 7.0, .0, .0),
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
                      SizedBox(width: 42.0),
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
            onTap: () => confirm(),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(105.0, 30.0, 105.0, .0),
                  // color: Color(0xFF21BFBD),
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF21BFBD),
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Text(
                    "Continue...",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
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
