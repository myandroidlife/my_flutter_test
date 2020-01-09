import 'package:flutter/material.dart';

class MyPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPagerStat();
  }
}

class MyPagerStat extends State<MyPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: <Widget>[

        ],
      ),
    );
  }
}
