import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numed/constants/color_constant.dart';
import 'package:numed/main.dart';
import 'package:numed/screens/get_all_doctors_screen.dart';

//Callback type definition for sharing the selected index.
typedef void AppointmentTypeCallback(String btnValue);

class outlineBtn extends StatefulWidget {
  final AppointmentTypeCallback sendBtnvalue;

  outlineBtn({Key key, this.sendBtnvalue}) : super(key: key);

  @override
  _outlineBtnState createState() => _outlineBtnState();
}

class _outlineBtnState extends State<outlineBtn> {
  List<IconData> iconList = [Icons.videocam, Icons.chat_bubble, Icons.hotel];
  List<String> nameList = ["Video Call", "Chatting", "Offline"];
  String btnValue;
  int selectedIndex = 0;
  int secondaryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              customRadio2(iconList[0], 0, nameList[0]),
              customRadio2(iconList[1], 1, nameList[1]),
              customRadio2(iconList[2], 2, nameList[2]),
            ],
          ),
        ],
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void changeSecondaryIndex(int index) {
    setState(() {
      secondaryIndex = index;
      btnValue = nameList[index];
      //set selected btn value
      widget.sendBtnvalue(btnValue);
    });
  }

  Widget customRadio2(IconData icon, int index, String name) {
    return Container(
        child: Column(
      children: <Widget>[
        OutlineButton(
          onPressed: () => changeSecondaryIndex(index),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          borderSide: BorderSide(
              color: secondaryIndex == index ? headingColor : Colors.grey),
          child: Icon(
            icon,
            color: secondaryIndex == index ? headingColor : Colors.grey,
          ),
        ),
        Text(name),
      ],
    ));
  }
}
