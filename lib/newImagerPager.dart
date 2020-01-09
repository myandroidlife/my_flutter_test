import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class myImagerPagers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      title: "学习图片页面",
      theme: ThemeData(primaryColor: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: Center(child: Text("Imager",style: TextStyle(fontSize: 30),),),
        ),
        body: Other(),
      ),
    );
  }
}

class Other extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5;
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(color: Colors.grey),
            child: Image.network(
               'http://file02.16sucai.com/d/file/2014/1006/e94e4f70870be76a018dff428306c5a3.jpg'),
          ),
          //Image.asset('assets/imagers/abc.jpg'),
          Row(
            children: <Widget>[
              Image.asset(
                'assets/imagers/icon_class.png',
                width: width,
                height: width,
              ),
              Image.asset(
                'assets/imagers/icon_class.png',
                width: width,
                height: width,
              ),
              Image.asset(
                'assets/imagers/icon_class.png',
                width: width,
                height: width,
              ),
              Image.asset(
                'assets/imagers/icon_class.png',
                width: width,
                height: width,
              ),
              Image.asset(
                'assets/imagers/icon_class.png',
                width: width,
                height: width,
              )
            ],
          ),
          _MemoryImagerWidget(),
          FileImageWidget(),
          //  Image.asset('')
        ],
      ),
    );
  }
}

class StudyMyPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudyImagerStat();
  }
}

class StudyImagerStat extends State<StudyMyPager> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 5;
    //主页面组件
    return Scaffold(
      appBar: AppBar(
        title: Text("学习图片页面"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            //图片的加载方式,各种加载方式
            Container(
              //设置容器大小
              width: 320.0,
              height: 203.0,
              decoration: BoxDecoration(
                  //背景色
                  color: Colors.yellow),
              child: Image.network(
                  "http://img5.imgtn.bdimg.com/it/u=3008142408,2229729459&fm=26&gp=0.jpg"),
            ), //图片
            Column(
              children: <Widget>[
                Row(
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    //底部的一组导航栏
                    Container(
                        width: width,
                        height: width,
                        child: Image.network(
                            "http://img5.imgtn.bdimg.com/it/u=3008142408,2229729459&fm=26&gp=0.jpg")),
                    Container(
                      width: width,
                      height: width,
                    ),
                    // Container(color: Colors.blue ,width: 100,height: 100,child: Image.asset("assets/imagers/icon_class.png"),),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              child: Image.asset("imagers/icon_class.png"),
                              width: width,
                              height: width,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FileImageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FileImageStat();
  }
}

//** 文件中获取图片
class FileImageStat extends State<FileImageWidget> {
  var _imager;

  Future getImger() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imager = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _imager == null
              ? Text('未选择图片')
              : Image.file(
                  _imager,
                  height: 100,
                  width: 100,
                ),
        ),
        FlatButton(
          onPressed: getImger,
          child: Text("选择图片"),
        ),
        FlatButton(
          onPressed: getImger,
          child: Text("选择图片",style: TextStyle(backgroundColor: Colors.red,color: Colors.white,),),
        )
      ],
    );
  }
}

class _MemoryImagerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MemoryStat();
  }
}

class _MemoryStat extends State<_MemoryImagerWidget> {
  Uint8List bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load("assets/imagers/icon_home_page.png").then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final de = BoxDecoration(
        image:
            DecorationImage(image: bytes == null ? null : MemoryImage(bytes)));
    return Container(
      decoration: de,
      width: 30,
      height: 30,
    );
  }
}
