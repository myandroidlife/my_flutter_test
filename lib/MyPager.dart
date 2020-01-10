import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/r.dart';

import 'entity/Items.dart';

class MyPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPagerStat();
  }
}

class MyPagerStat extends State<MyPager> {
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
      if (notification is ScrollUpdateNotification &&
          notification.depth == 0) {
        setState(() {
          height = notification.metrics.pixels;
        });
      }
    },
    child: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          _addAllData(),
          _itemGoods()
        ],
      ),
    ));
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 228,
      floating: false,
      pinned: true,
       snap: false,
      title: Text(
          MediaQueryData.fromWindow(window).padding.top + 56 <= height
              ? "我的"
              : ""),
      backgroundColor: MediaQueryData.fromWindow(window).padding.top + 56 <= height
          ?Color(0xffcd1317):Colors.white,
      actions: <Widget>[
        Image.asset('assets/imagers/set.png'),
        Image.asset('assets/imagers/message.png')
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Stack(
          children: <Widget>[
            Image.asset(
              'assets/imagers/icon_my_bg.png',
              height: 236,
              fit: BoxFit.fitHeight,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQueryData.fromWindow(window).padding.top + 58,
                  left: 15),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'assets/imagers/default_head.png',
                    height: 58,
                    width: 58,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '我是新用户',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Image.asset('assets/imagers/white_arraow_right.png'),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 50,
                  right: 50,
                  top: MediaQueryData.fromWindow(window).padding.top + 123),
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _textInfo('4', '商品收藏'),
                  _textInfo('4', '店铺关注'),
                  _textInfo('4', '浏览记录'),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 9, right: 9),
                child: PhysicalModel(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 19, top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        PhysicalModel(
                          color: Color(0xffcd13117),
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(13),
                              bottom: Radius.circular(13)),
                          child: SizedBox(
                            height: 11,
                            width: 5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '宝励常用',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _addAllData() {
  return  SliverList(delegate: SliverChildListDelegate([
       Container(margin: EdgeInsets.only(left: 9,right: 9),color: Color(0xfffafafa),height: 1,),
      Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)))
        ,padding: EdgeInsets.fromLTRB(12, 10, 12, 20),margin: EdgeInsets.only(left: 9,right: 9)
        ,child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            addData("我的订单", R.assetsImagersMyOrder),
            addData("我的钱包", R.assetsImagersMyWallet),
            addData("我的提现", R.assetsImagersMyWithdrawal),
            addData("我的转账", R.assetsImagersMyTransfer),
            addData("交易明细", R.assetsImagersTransactionDetails),
          ],mainAxisAlignment: MainAxisAlignment.spaceBetween,),
          Row(children: <Widget>[
            addData("我的复消", R.assetsImagersMyAfterElimination),
            addData("我的复投", R.assetsImagersShareholderDividends),
            addData("股东分红", R.assetsImagersShareholderDividends),
            addData("店铺中心", R.assetsImagersShopCenter),
            addData("代理业绩", R.assetsImagersAgentPerformance),
          ],mainAxisAlignment: MainAxisAlignment.spaceBetween,)
        ],
      ),),
    Container(margin: EdgeInsets.fromLTRB(9, 10, 9, 10),decoration:BoxDecoration(borderRadius: BorderRadius.circular(10)),child: Column(children: <Widget>[
      Image.asset(R.assetsImagersAgentAddImg),
      _shareholderCertification(),

    ],),),
    _youLike()
    ]));

  }

  _textInfo(String size, String info) {
    return Column(
      children: <Widget>[
        Text(
          size,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        Text(
          info,
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  addData(String title, String resouce) {
    return Column(children: <Widget>[
      Image.asset(resouce,width: 42,height: 42,),
      Text(title,style: TextStyle(fontSize: 12,color: Color(0xff333333)),)
      ],mainAxisAlignment: MainAxisAlignment.center,);
  }

  _itemGoods() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 175 / 262, //子控件宽高比
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Items.getGoodItem(context, index,Items.goods[index]);
      }, childCount: Items.goods.length),
    );
  }
}

 _shareholderCertification() {
  return Padding(padding: EdgeInsets.fromLTRB(10, 13, 10, 13),child:  Stack(children: <Widget>[
    Row(
      children: <Widget>[
        Image.asset(
          "assets/imagers/notify.png",
          height: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '宝励股东：',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '资质认证',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              color: Color(0xffcd1317)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '享股东分红专属特权…',
          style:
          TextStyle(fontSize: 12, color: Color(0xff333333)),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    ),
    Row(
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
      mainAxisAlignment: MainAxisAlignment.end,
    ),
  ],),);



}
_youLike() {
  return Container(
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
        );
}
