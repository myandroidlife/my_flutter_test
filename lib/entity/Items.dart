import 'package:flutter/material.dart';
import 'package:flutter_app/sliver/GoodsDetail.dart';
class Items{
 static List<String> goods = ['goods1','goods2','goods3','goods4',];
 static getGoodItem(BuildContext context, int index,String img,{bool isShow=false}) {
    return GestureDetector(child: Container(
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
        )),onTap: (){
      Navigator.push(context,new MaterialPageRoute(builder: (context){
        return GoodsDetail();
      }));
    },);
  }
  //地址条目
static addressItem(context){
   return PhysicalModel(color: Colors.white,borderRadius: BorderRadius.circular(6),child:Padding(padding: EdgeInsets.fromLTRB(16, 10, 16, 10),child: Row(children: <Widget>[
     Expanded(child:  Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment:CrossAxisAlignment.start,children: <Widget>[
       Text('余怀斌  18306074517',style: TextStyle(fontSize: 16,color: Color(0xff333333),fontWeight: FontWeight.w900),),
       Row(children: <Widget>[
         Container(margin: EdgeInsets.only(top: 8),child: Text('默认',style: TextStyle(color: Colors.white),),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)
             ,color: Color(0xffcd1317)),padding: EdgeInsets.fromLTRB(12, 3, 12, 3),),
      Container(child:  Text('重庆市渝北区新牌坊红锦大道555号',style: TextStyle(fontSize: 12,color: Color(0xff666666)),),margin: EdgeInsets.only(top: 8,left: 10),)
       ],)
     ],),flex: 1,),
     Icon(Icons.keyboard_arrow_right)
   ],),),);
}

  static goodsInfoItem(BuildContext context) {
   return PhysicalModel(color: Colors.white,borderRadius: BorderRadius.circular(6),child:Padding(padding: EdgeInsets.fromLTRB(16, 10, 16, 10),child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
     Text('宝励自营',style: TextStyle(fontSize: 16,color: Color(0xff333333),fontWeight: FontWeight.w900),),
     SizedBox(height: 9,),
     Row(children: <Widget>[
       ClipRRect(child: Image.network('https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&qual'
           'ity=100&size=b4000_4000&sec=1578989166&di=8e66236a852a76b68b651efa8780c61e&src=ht'
           'tp://img011.hc360.cn/m8/M09/5E/90/wKhQpVXcIsqECsh3AAAAAG2-m0s703.jpg',height: 80,width: 80,fit: BoxFit.cover,)
         ,borderRadius: BorderRadius.circular(5),),Expanded(child: Container(child: Stack(children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(10, 5, 0, 0),child:  Row(children: <Widget>[
            Expanded(child: Text('宝励百草液1瓶+宝励冷敷贴...',style: TextStyle(fontSize: 14,color: Color(0xff333333)),)),
            Text('×1')
          ],),),
        Padding(padding: EdgeInsets.fromLTRB(10, 5, 0, 0),child:Text('组合：冷敷贴1盒+百草液1瓶；',style: TextStyle(fontSize: 10,color: Color(0xff333333)),))
        ],),
      Align(alignment: Alignment.bottomLeft,child: Padding(padding: EdgeInsets.only(left: 10),child: Text.rich(TextSpan(text: '￥',style: TextStyle(fontSize: 10,color: Color(0xffcd1317),fontWeight: FontWeight.w900),children: [
        TextSpan(text: '600',style: TextStyle(fontSize: 16)),
        TextSpan(text: '.00',style: TextStyle(fontSize: 10))
      ])),),)

       ],),height: 80,))
     ],)
   ],)));
  }
}