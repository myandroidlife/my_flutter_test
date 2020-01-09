import 'package:flutter/material.dart';
class Items{
 static getGoodItem(BuildContext context, int index,{bool isShow=false}) {
    return Container(
      margin: EdgeInsets.only(
          left: index % 2 == 0 ? 8 : 0, right: index % 2 == 0 ? 0 : 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: PhysicalModel(color: Colors.white,elevation: 1,borderRadius: BorderRadius.circular(10),child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Stack(children: <Widget>[
              Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579070245&di=6c8c91b046dad868bf988f6dbd3064f8&imgtype=jpg&er=1&src=http%3A%2F%2Fimg1.efu.com.cn%2Fupfile%2Fnews%2Fcommonly%2F2012%2F2012-02-28%2F2a7d6915-a7bf-4f8f-915f-d26fd2a1ef3f.jpg',
                fit: BoxFit.cover,
                width: 500,
                height: 175,
              ),Image.asset(isShow?'assets/imagers/owner_subscript.png':'',height: 62,width: 62,)
            ],),
          ),
          Container(
            child: Text(
              '丹尼尔惠灵顿（Danielwellington）...',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            padding: EdgeInsets.fromLTRB(8, 10, 8, 12),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
            child: Text(
              "¥1298.00",
              style: TextStyle(fontSize: 12, color: Color(0xffcd1317)),
            ),
          )
        ],
      ),
    ));
  }
}