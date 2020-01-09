import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Center(
          child: Stack(
            children: <Widget>[
              Align(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xfff6f6f6)),
                  child: Center(
                    child: Text(
                      "网红打卡地 景点 酒店 美食",
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Image.asset(
                    'assets/imagers/search.png',
                    height: 20,
                  ),
                ),
                alignment: Alignment.centerLeft,
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.voice_chat,
                  ),
                ),
                heightFactor: 30,
                alignment: Alignment.centerRight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
