import 'dart:ui';
import 'package:flutter/material.dart';

import 'entity/Items.dart';

//成为店主页面
class BecomeAShopOwner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BecomeAShopOwnerStat();
  }
}

class BecomeAShopOwnerStat extends State<BecomeAShopOwner> {
  double height = 0;

  @override
  void initState() {
    super.initState();
  }

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
            new SliverAppBar(
              floating: false,
              pinned: true,
              centerTitle: true,
              title: Text(
                  MediaQueryData.fromWindow(window).padding.top + 56 <= height
                      ? "升级店主"
                      : ""),
              expandedHeight: 235,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(

                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset('assets/imagers/is_story_banner.png',
                              fit: BoxFit.fill),
                          Image.asset(
                            'assets/imagers/is_story_banner_bo.png',
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.only(top: 24),
                          padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Row(
                              children: <Widget>[
                                Image.asset('assets/imagers/img_left.png',height: 14,width: 14,),
                                Text('购买以下商品升级为店主',style: TextStyle(color: Color(0xff8F5F2A),fontSize: 14),),
                                Image.asset('assets/imagers/img_right.png',height: 14,width: 14,),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            )),
                      )
                    ],
                  )),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
                childAspectRatio: 175 / 262, //子控件宽高比
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Items.getGoodItem(context, index,isShow: true);
                },
                childCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
