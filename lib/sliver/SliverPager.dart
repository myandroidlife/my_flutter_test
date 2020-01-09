import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/entity/Items.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:fluttertoast/fluttertoast.dart' ;

class SliverTestPager extends StatelessWidget {
  final Function(double offset) offset;

  SliverTestPager(this.offset);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Image Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xffcd1317)),
      home: new HomePage(context, offset),
    );
  }
}

class HomePage extends StatefulWidget {
  var parenContext;
  final Function(double offset) offset;
  HomePage(this.parenContext, this.offset);

  @override
  State<StatefulWidget> createState() => new _SliverTestPageState(parenContext);
}

class _SliverTestPageState extends State<HomePage> {
  BuildContext parenContext;
  String info = "";
  _SliverTestPageState(this.parenContext);
  GlobalKey _anchorKey = GlobalKey();
  ScrollController _controller;

  List<IntSize> _sizes = _createSizes(_kItemCount).toList();

  static const int _kItemCount = 1000;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  NotificationListener(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification &&
              notification.depth == 0) {
            if(widget.offset!=null){
              widget.offset(notification.metrics.pixels);
            }

          }
        },
        child: new CustomScrollView(
          controller: _controller,
          slivers: <Widget>[

            buildSliverAppBar(),
            new SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 4,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1, //子控件宽高比
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return _getMenu(context, index);
                  },
                  childCount: 8,
                )),
            new SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return infItem(context, index);
                }, childCount: 1)),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
                childAspectRatio: 175 / 262, //子控件宽高比
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Items.getGoodItem(context, index);
                },
                childCount: 20,
              ),
            ),
             SliverStaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: <Widget>[
                PhysicalModel(borderRadius: BorderRadius.circular(5),color: Colors.white,child:  Container(
                  child: CircleAvatar(child: Text('1'),),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),padding: EdgeInsets.all(20),
                ),elevation: 3,), Container(
                  child: Text('2'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('3'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('4'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('5'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('6'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('7'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('8'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('7'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ), Container(
                  child: Text('8'),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                ),
              ],
              staggeredTiles: const <StaggeredTile>[
                const StaggeredTile.count(2, 2),
                const StaggeredTile.count(2, 1),
                const StaggeredTile.count(2, 2),
                const StaggeredTile.count(2, 3),
                const StaggeredTile.count(2, 2),
                const StaggeredTile.count(2, 1),
                const StaggeredTile.count(2, 2),
                const StaggeredTile.count(2, 1),
                const StaggeredTile.count(2, 2),
                const StaggeredTile.count(2, 1),
              ],
            ),
//             SliverStaggeredGrid.countBuilder(
//              crossAxisCount: 2,
//              mainAxisSpacing: 4.0,
//              crossAxisSpacing: 4.0,
//              itemBuilder: (context, index) => new _Tile(index, _sizes[index]),
//              staggeredTileBuilder: (index) => new StaggeredTile.fit(1),
//            )
          ],
        ),
      ),


    );
  }

  SliverAppBar buildSliverAppBar() {
    return new SliverAppBar(
            key: _anchorKey,
            expandedHeight: 230.0,
            floating: false,
            pinned: true,
            snap: false,
            actions: <Widget>[
              new IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  print("添加");
                },
              ),
              new IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: () {
                  print("更多");
                },
              ),
            ],
            flexibleSpace: new FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                background: Stack(
                  children: <Widget>[
                    Swiper(
                      autoplay: true,
                      autoplayDelay: 5000,
                      pagination: SwiperPagination(),
                      itemHeight: 278.0,
                      itemBuilder: (BuildContext context, int index) {
                        return new Image.network(
                          'http://a.hiphotos.baidu.com/zhidao/pic/item/b17eca8065380cd7f92497e2a044ad3459828182.jpg',
                          fit: BoxFit.fill,
                          height: 278.0,
                        );
                      },
                      itemCount: 10,
//                viewportFraction: 0.8,
//                scale: 0.9,
                    ),
                    Align(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(6)),
                        child: Container(
                          height: 6,
                          color: Color(0xffffffff),
                        ),
                      ),
                      alignment: FractionalOffset.bottomCenter,
                    )
                  ],
                )),
            leading: new IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(parenContext);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SliverTestPager()));
              },
            ),
          );
  }



  Widget _getMenu(BuildContext context, int index) {
    return Container(
        height: 64,
        color: Colors.white,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1783949068,4013858466&fm=26&gp=0.jpg',
                width: 40,
                height: 40,
              ),
              Center(
                child: Text(
                  "本真护肤",
                  style: TextStyle(color: Color(0xff333333), fontSize: 12),
                ),
              )
            ],
          ),
          onTap: () {
            print('This is Center Short Toast $index');
//            Fluttertoast.showToast(
//                msg: "This is Center Short Toast $index",
//                backgroundColor: Color(0xff000000),
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.CENTER,
//                timeInSecForIos: 1,
//                textColor: Color(0xffffffff));
          },
        ));
  }

  Widget infItem(BuildContext context, int index) {
    return Container(
      height: 204,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
            child: Container(
              height: 6,
              color: Color(0xffffffff),
            ),
          ),
          Image.asset(
            "assets/imagers/home_pager_bg.png",
            height: 114,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(9, 0, 9, 10),
            decoration: BoxDecoration(color: Color(0xfff6f6f6)),
            child: Container(
              height: 38,
              decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                  color: Color(0xffffffff)),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: new Stack(
                children: <Widget>[
                  new Align(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/imagers/notify.png",
                          height: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '微励报：',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '热门',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Color(0xffcd1317)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '宝励全新推出医用冷敷贴…',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff333333)),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    alignment: FractionalOffset.centerLeft,
                  ),
                  new Align(
                    child: Row(
                      children: <Widget>[
                        Text(
                          '更多',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff333333)),
                        ),
                        Image.asset(
                          "assets/imagers/arraow_right.png",
                          height: 12,
                        )
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    alignment: FractionalOffset.centerRight,
                  )
                ],
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(125, 17, 125, 0),
                height: 2,
                color: Color(0xff999999),
                alignment: Alignment.center,
              ),
              Center(
                child: Container(
                  height: 36,
                  padding: EdgeInsets.fromLTRB(6, 9, 6, 0),
                  child: Text(
                    "宝励精品",
                    style: TextStyle(
                        fontSize: 12, backgroundColor: Color(0xfff6f6f6)),
                  ),
                ),
              )
            ],
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
class IntSize {
  const IntSize(this.width, this.height);

  final int width;
  final int height;
}
List<IntSize> _createSizes(int count) {
  Random rnd = new Random();
  return new List.generate(count,
          (i) => new IntSize((rnd.nextInt(500) + 200), rnd.nextInt(800) + 200));
}
class _Tile extends StatelessWidget {
  const _Tile(this.index, this.size);

  final IntSize size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Column(
        children: <Widget>[
          new Stack(
            children: <Widget>[
              //new Center(child: new CircularProgressIndicator()),
              new Center(
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/${size.width}/${size.height}/',
                ),
              ),
            ],
          ),
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Column(
              children: <Widget>[
                new Text(
                  'Image number $index',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  'Width: ${size.width}',
                  style: const TextStyle(color: Colors.grey),
                ),
                new Text(
                  'Height: ${size.height}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);