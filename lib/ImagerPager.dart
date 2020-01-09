import 'package:flutter/material.dart';

class ImagerPager extends StatelessWidget {//一个主页面看效果
  String get title => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: "图片信息",
        home: myPagers()
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
        );
  }


}
class myPagers extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new pager();
  }
}

class pager extends State<myPagers>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        appBar: AppBar(
          title: Text("图片页面"),
        ),
        body: Container(
          width: 200,
          height: 300,
          child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                  border: Border.all(
                    //边框颜色
                    color: Colors.red,
                    //边框粗细
                    width: 6.0,
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=159400450,938542721&fm=26&gp=0.jpg")))),

        ));
  }
}
