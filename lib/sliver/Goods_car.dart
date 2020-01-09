import 'package:barcode_scan/barcode_scan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/entity/Items.dart';
import 'package:qr_flutter/qr_flutter.dart';
Future scan() async {
  try {
    // 此处为扫码结果，barcode为二维码的内容
    String barcode = await BarcodeScanner.scan();
    print('扫码结果: '+barcode);
  } on FormatException{
    // 进入扫码页面后未扫码就返回
    print('进入扫码页面后未扫码就返回');
  } catch (e) {
    // 扫码错误
    print('扫码错误: $e');
  }
}
class GoodsCar extends StatefulWidget {
  @override
  GoodsCarStat createState() => GoodsCarStat();
}

class GoodsCarStat extends State<GoodsCar> {
  bool _isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        title: Text(
          '购物车',
          style: TextStyle(fontSize: 20, color: Color(0xff333333)),
        ),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _isEmpty ? _emptyWight() : _goodsWeight(),
          _youLike(),
          _youLikeGoods(),
        ],
      ),
    );
  }

  _emptyWight() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Column(
        children: <Widget>[

//          GestureDetector(child: QrImage(
//            data: "app图标",
//            version: QrVersions.auto,
//            embeddedImage: AssetImage('assets/imagers/empty_logo.png'),
//            size: 150.0,
//
//          ),onTap: (){scan();},),
          SizedBox(
            height: 70,
          ),
          Image.asset(
            'assets/imagers/empty_logo.png',
            width: 74,
            height: 110,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '购物车空空如也',
            style: TextStyle(fontSize: 18, color: Color(0xff8c8c8c)),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            '快去挑几件喜欢的商品吧',
            style: TextStyle(fontSize: 14, color: Color(0xff8c8c8c)),
          ),
          SizedBox(
            height: 40,
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(
              '去逛逛',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.fromLTRB(36, 11, 36, 11),
            color: Color(0xffcd1317),
            elevation: 5,
          ),
          SizedBox(
            height: 40,
          ),
//            Container(margin: EdgeInsets.only(top: 40,bottom: 40),decoration:BoxDecoration(borderRadius: BorderRadius.circular(20),
//                color: Color(0xffcd1317)),padding: EdgeInsets.fromLTRB(36, 11, 36, 11),
//              child: MaterialButton(onPressed: null,child: Text('去逛逛',style: TextStyle(fontSize: 14,color:Colors.white),),) ,)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      )
    ]));
  }

  bool isCheck = false;

  _goodsWeight() {
    return SliverList(delegate: SliverChildListDelegate(_googds()));
  }

  _youLike() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xfff6f6f6), Colors.transparent],
                      tileMode: TileMode.repeated)),
              width: 25,
              height: 2,
              margin: EdgeInsets.only(right: 6),
            ),
            Padding(
              padding: EdgeInsets.only(right: 2),
              child: Image.asset(
                'assets/imagers/you_like.png',
                width: 16,
                height: 16,
              ),
            ),
            Text(
              '猜你喜欢',
              style: TextStyle(fontSize: 16, color: Color(0xff333333)),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xfff6f6f6), Colors.transparent],
                      tileMode: TileMode.repeated)),
              width: 25,
              height: 2,
              margin: EdgeInsets.only(left: 6),
            ),
          ],
        ),
      )
    ]));
  }

  _youLikeGoods() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Items.getGoodItem(context, index);
        }, childCount: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 175 / 262,
        ));
  }



  List<Widget> _googds() {
    List<Widget> goods = [];
    for (int i = 0; i < 10; i++) {
      goods.add(_itemGoods());
    }
    return goods;
  }

  _itemGoods() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RoundCheckBox(
                isSelect: isCheck,
                selectIcon: 'assets/imagers/check.png',
                unSelectIcon: 'assets/imagers/un_check.png',
                oncheck: (check) {
                  setState(() {
                    isCheck = !isCheck;
                  });
                },
              ),
              Text('宝励自营')
            ],
          ),
          Row(
            children: <Widget>[
              RoundCheckBox(
                isSelect: isCheck,
                selectIcon: 'assets/imagers/check.png',
                unSelectIcon: 'assets/imagers/un_check.png',
                oncheck: (check) {
                  setState(() {
                    isCheck = !isCheck;
                  });
                },
              ),
              ClipRRect(
                child: Image.network(
                  'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2168486239,1962133587&fm=26&gp=0.jpg',
                  width: 90,
                  height: 90,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 90,
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '私密青春，清洁、抑菌、止痒缩阴、袪味宝砺草本抑菌凝胶…',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff333333)),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '¥ 298.00',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffcd1317),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          children: <Widget>[
                            Text(
                              '—',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900),
                            ),
                            Container(
                              child: Text(
                                '1',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.w900),
                              ),
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0xfff6f6f6)),
                            ),
                            Text(
                              '＋',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class RoundCheckBox extends StatefulWidget {
  final String selectIcon; //选中的图片
  final String unSelectIcon; //没选中的图片
  final bool isSelect; //是否选中
  final Function(bool check) oncheck;

  const RoundCheckBox(
      {Key key,
      this.selectIcon,
      this.unSelectIcon,
      this.isSelect = false,
      this.oncheck})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RoundCheckBoxStat();
  }
}

class RoundCheckBoxStat extends State<RoundCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        widget.isSelect ? widget.selectIcon : widget.unSelectIcon,
        width: 34,
        height: 34,
      ),
      onTap: () {
        widget?.oncheck(widget.isSelect);
      },
    );
  }
}
