import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:numed/screens/doctordetail.dart';
import 'package:numed/constants/color_constant.dart';
import 'package:numed/constants/style_constant.dart';
import 'package:numed/widgets/outlineBtn.dart';

class getDoctors extends StatefulWidget {
  @override
  _getDoctorsState createState() => _getDoctorsState();
}

class _getDoctorsState extends State<getDoctors> {



  Future<List> getData() async {
    final response =
        await http.get("https://technogenr.com/flutter_test/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: mCardTitleColor,
          title: new Text("Doctors"),
        ),
        body: Container(
          decoration: new BoxDecoration(color: kBackgroundColor),
          child: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? new getDoctorslists(
                      list: snapshot.data,
                    )
                  : new Center(
                      child: new CircularProgressIndicator(),
                    );
            },
          ),
        ));
  }
}

class getDoctorslists extends StatelessWidget {
  final List list;
  List<IconData> iconList = [Icons.videocam, Icons.chat_bubble, Icons.hotel];
  List<String> nameList = ["Video Call", "Chatting", "Offline"];
  int selectedIndex = 0;
  int secondaryIndex = 0;
  String ps="sanjeev";

  getDoctorslists({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      list[i]['item_name'],
                                      style: mTitleStyle,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Text(
                                      "${list[i]['stock']} years of experience",
                                      style: doctorsSubtitle,
                                    ),
                                    Text(
                                      'MBBS,PGDD (Diabetes)',
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
                outlineBtn(),
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
                          new RaisedButton(
                            color: mCardTitleColor,
                            onPressed: () =>
                              Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                              list: list,
                              index: i,
                              ))),
                            child: new Text("Book",style: TextStyle(color: BackgroundColor),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
