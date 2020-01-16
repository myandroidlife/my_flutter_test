import 'package:flutter/material.dart';

class Widgets {
  static AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: TextStyle(color: Color(0xff333333)),
      ),
      centerTitle: true,
      brightness: Brightness.light,
      leading: GestureDetector(
        child: Padding(
            padding: EdgeInsets.only(right: 20,left: 15,top: 10,bottom: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff333333),
            )),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
