//import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
//import '../../services/ScreenAdaper.dart';
//
//class HomePage extends StatefulWidget {
//  HomePage({Key key}) : super(key: key);
//
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  //轮播图：
//  //flutter run -d all 链接多个设备的命令：
//  Widget _swiperWidget() {
//    List<Map> imgList = [
//      {"url": "https://www.itying.com/images/flutter/slide01.jpg"},
//      {"url": "https://www.itying.com/images/flutter/slide02.jpg"},
//      {"url": "https://www.itying.com/images/flutter/slide03.jpg"}
//    ];
//
//    return Container(
//      child: AspectRatio(
//        aspectRatio: 2 / 1,
//        child: Swiper(
//          itemBuilder: (BuildContext context, int index) {
//            return new Image.network(
//              imgList[index]['url'],
//              fit: BoxFit.fill,
//            );
//          },
//          itemCount: imgList.length,
//          pagination: new SwiperPagination(),
//          control: new SwiperControl(),
//          autoplay: true,
//        ),
//      ),
//    );
//  }
//
//  //标题：
//  Widget _titleWidget(value) {
//    return Container(
//      height: ScreenAdaper.height(46),
//      margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
//      padding: EdgeInsets.only(left: ScreenAdaper.width(20)),
//      decoration: BoxDecoration(
//          border: Border(
//              left: BorderSide(
//                  color: Colors.red, width: ScreenAdaper.width(10)))),
//      child: Text(value, style: TextStyle(color: Colors.black54)),
//    );
//  }
//
//  //热门商品：
//  Widget _hotProductListWidget() {
//    return Container(
//      height: ScreenAdaper.height(240),
//      padding: EdgeInsets.all(ScreenAdaper.width(20)),
//      // width: double.infinity, //寬度自適應
//      child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//        itemBuilder: (contxt, index) {
//          return Column(
//            children: <Widget>[
//              Container(
//                height: ScreenAdaper.height(140),
//                width: ScreenAdaper.width(140),
//                margin: EdgeInsets.only(right: ScreenAdaper.width(21)),
//                child: Image.network(
//                    'https://www.itying.com/images/flutter/hot${index + 1}.jpg',
//                    fit: BoxFit.cover),
//              ),
//              Container(
//                padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
//                height: ScreenAdaper.height(44),
//                child: Text('第${index}条'),
//              )
//            ],
//          );
//        },
//        itemCount: 9,
//      ),
//    );
//  }
//
//  Widget _recProductItemListWidget() {
//    var itemWidth = (ScreenAdaper.getScreenWidth() - 30) / 2;
//    return Container(
//      padding: EdgeInsets.all(ScreenAdaper.width(20)),
//      width: itemWidth,
//      decoration:
//      BoxDecoration(border: Border.all(color: Colors.black12, width: 1)),
//      child: Column(
//        children: <Widget>[
//          Container(
//            width: double.infinity,
//            child: AspectRatio(
//              aspectRatio: 1 / 1,
//              child: Image.network(
//                  "https://www.itying.com/images/flutter/list1.jpg",
//                  fit: BoxFit.cover),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(top: ScreenAdaper.height(10)),
//            child: Text(
//              '2019秋季大促2019秋季大促2019秋季大促2019秋季大促2019秋季大促2019秋季大促',
//              maxLines: 2,
//              overflow: TextOverflow.ellipsis,
//              style: TextStyle(color: Colors.black54),
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(top: ScreenAdaper.height(20)),
//            child: Stack(
//              children: <Widget>[
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: Text(
//                    '123',
//                    style: TextStyle(color: Colors.red, fontSize: 16),
//                  ),
//                ),
//                Align(
//                  alignment: Alignment.centerRight,
//                  child: Text(
//                    '123',
//                    style: TextStyle(
//                        color: Colors.black54,
//                        fontSize: 16,
//                        decoration: TextDecoration.lineThrough),
//                  ),
//                )
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    ScreenAdaper.init(context);
//    return ListView(
//      children: <Widget>[
//        _swiperWidget(),
//        SizedBox(height: ScreenAdaper.height(20)),
//        _titleWidget("猜你喜欢"),
//        _hotProductListWidget(),
//        SizedBox(height: ScreenAdaper.height(20)),
//        _titleWidget("热门推荐"),
//        Container(
//          padding: EdgeInsets.all(10),
//          child: Wrap(
//            runSpacing: 10,
//            spacing: 10,
//            children: <Widget>[
//              _recProductItemListWidget(),
//              _recProductItemListWidget(),
//              _recProductItemListWidget(),
//              _recProductItemListWidget(),
//              _recProductItemListWidget(),
//              _recProductItemListWidget()
//            ],
//          ),
//        )
//      ],
//    );
//  }
//}