import 'package:flutter/material.dart';

import 'ImagerPager.dart';

class mPager extends StatelessWidget {
  String get title => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "我的页面",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title ?? "我的页面"),
        ),
        body: ListView(children: getListItem()),
//        body: Center(
//          child: Column(
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  new BackButton(
//                    color: Colors.red,
//                    onPressed: lo(),
//                  ),
//                  new Text('Row One'),
//                  new Text('Row Two'),
//                  new Text('Row Three'),
//                  new Text(
//                    'Row Four',
//                    textWidthBasis: TextWidthBasis.longestLine,
//                  ),
//                ],
//              ),
//              Text("你好，世界"),
//              Text(
//                "你好，世界",
//                style: TextStyle(
//                    backgroundColor: Colors.amberAccent,
//                    color: Colors.white,
//                    fontSize: 20),
//                textDirection: TextDirection.ltr,
//              ),
//
//            ],
//          ),
//        ),
      ),
    );
  }

  lo() {}

  List<Widget> getListItem() {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      //var s = i.toString() + "\u3000item";
      var item = new GestureDetector(
          child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child:  new Text(
              "Row $i",
            ),),
          onTap: () {
            runApp(ImagerPager());
            print("Row $i");
          });
      widgets.add(item);
      // widgets.add(new Padding(padding: EdgeInsets.all(10.0), child: Text(s)));
    }
    return widgets;
  }
    Widget getChide(int i) {
      if (i == 3) {
        Image.network(
            "http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc03924590b2a9b58d94a4c27d1e2500.jpg");
      } else {
        new Text(
          "Row $i",
        );
      }
    }
}
