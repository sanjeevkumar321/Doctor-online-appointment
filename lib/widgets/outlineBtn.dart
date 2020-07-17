import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numed/constants/color_constant.dart';
import 'package:numed/main.dart';
import 'package:numed/screens/get_all_doctors_screen.dart';

class outlineBtn extends StatefulWidget {
final void customFunction;
outlineBtn({Key key,this.customFunction}):super(key:key);

  @override
  _outlineBtnState createState() => _outlineBtnState();
}

class _outlineBtnState extends State<outlineBtn> {
  String setapptype;



  List<IconData> iconList = [Icons.videocam, Icons.chat_bubble, Icons.hotel];
  List<String> nameList = ["Video Call", "Chatting", "Offline"];
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
              customRadio2(iconList[0], 0,nameList[0]),
              customRadio2(iconList[1], 1,nameList[1]),
              customRadio2(iconList[2], 2,nameList[2]),
            ],
          ),
        ],
      ),

    );
  }

  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  void changeSecondaryIndex(int index){
    setState(() {
      secondaryIndex = index;
      gv=nameList[index];
      print(gv);

//      widget.parentAction("Update from Child 1");
    });
  }

  Widget customRadio2(IconData icon,int index,String name){
    return Container(

      child:
        Column(
          children: <Widget>[
            OutlineButton(

              onPressed: () => changeSecondaryIndex(index),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              borderSide: BorderSide(color: secondaryIndex == index ? headingColor : Colors.grey),
              child: Icon(icon,color:  secondaryIndex == index ? headingColor : Colors.grey,),

            ),
            Text(name),
          ],
        )

    );
  }
}