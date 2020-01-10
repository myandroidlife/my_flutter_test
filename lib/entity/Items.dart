import 'package:flutter/material.dart';
class Items{
 static List<String> goods = ['goods1','goods2','goods3','goods4',];
 static getGoodItem(BuildContext context, int index,String img,{bool isShow=false}) {
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
              Image.asset(
                'assets/imagers/$img.png',
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