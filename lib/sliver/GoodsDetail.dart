import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../confirm_order.dart';
import '../select_info.dart';
import 'classification/goods_pop.dart';
import 'm_bottom_sheet.dart';

class GoodsDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoodsDetailStat();
  }
}

class GoodsDetailStat extends State<GoodsDetail> {
  int _currentIndex = 1;

  List<GoodsSelectInfo> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('升级店主',style: TextStyle(color: Color(0xff333333)),),
        centerTitle: true,
        brightness: Brightness.light,
        leading: GestureDetector(child: Icon(
          Icons.arrow_back_ios,
          color:  Color(0xff333333),
        ),onTap: (){
          Navigator.pop(context);
        },),
      ),
      body:ListView(children: <Widget>[
        _headImg(),
    Container(color:Colors.white,child:Text.rich(TextSpan(style: TextStyle(color: Color(0xffcd1314),fontSize: 18),text: '¥',
        children:[TextSpan(text: '600',style: TextStyle(color: Color(0xffcd1314),fontSize: 25)),
        TextSpan(text: '.00',style: TextStyle(color: Color(0xffcd1314),fontSize: 18))] )),padding: EdgeInsets.only(top: 15,left: 17),)
       ,Container(color:Colors.white,child: Text('DT塑性内衣'),padding: EdgeInsets.only(top: 15,left: 17,bottom: 25),),
        Container(color:Colors.white,child: Text('已付款：341件',style: TextStyle(color:Color(0xff8c8c8c)),),padding: EdgeInsets.only(left: 17,bottom: 15),),
        Container(color:Colors.white,child: Row(children: <Widget>[Expanded(child: Text('选择商品规格')),Image.asset('assets/imagers/arraow_right.png',height: 10,width: 14,),])
          ,padding: EdgeInsets.only(top: 17,bottom: 17,left: 17,right: 17),margin: EdgeInsets.only(top: 10),),
        Container(margin: EdgeInsets.only(top: 10),padding: EdgeInsets.all(17),color: Colors.white,child: Row(children: <Widget>[
          Container(height: 11,width: 5,decoration: BoxDecoration(color: Color(0xffcd1317),borderRadius: BorderRadius.all(Radius.circular(3))),margin: EdgeInsets.only(right: 10),),
         Text('评价',style: TextStyle(fontSize: 16)),Expanded(child: Padding(padding: EdgeInsets.only(left: 5),child: Text('152条',style: TextStyle(fontSize: 12),),)), 
          Text('查看更多',style: TextStyle(fontSize: 12,color: Color(0xff999999))),Image.asset('assets/imagers/arraow_right.png',height: 10,width: 14,color: Color(0xff999999),)
          
        ],),)
      ],),
      bottomNavigationBar: Container(height: 60,child: Padding(padding: EdgeInsets.fromLTRB(15, 7, 7, 15),child: Row(children: <Widget>[
        Column(children: <Widget>[
          Image.asset('assets/imagers/icon_contact.png'),
          SizedBox(height: 2,),
          Text('联系客服',style: TextStyle(fontSize: 10),)
        ],mainAxisAlignment: MainAxisAlignment.center,),
        Expanded(child:GestureDetector(child:  Container(child: Text('立即升级',style: TextStyle(color: Colors.white,fontSize: 14),),
          alignment: Alignment.center,height: 36,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),color: Color(0xffcd1317)),),onTap: (){
          showModalBottomSheet(useRootNavigator: true,isScrollControlled: true,context: context, builder: (context){
          if(  list ==null){
            list =  getGoosDetailList();
          }
          return _goodsSpecifications();
          },backgroundColor: Colors.transparent);
        },),flex: 1,)
      ],),),color: Colors.white,),

    );
  }
  List<String> pagers = ['assets/imagers/banner1.png','assets/imagers/banner2.png'];
  _headImg() {
    return Container(height: 204,child: Stack(children: <Widget>[
      Container(child:   Swiper(
        autoplay: true,
        autoplayDelay: 5000,
        itemHeight: 278.0,
        onIndexChanged: (index){
         setState(() {
           _currentIndex = index+1;
         });
        },
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            pagers[index],
            fit: BoxFit.fill,
            height: 278.0,
          );

        },
        itemCount: pagers.length,
//                viewportFraction: 0.8,
//                scale: 0.9,
      ),height: 204,),
      Image.asset('assets/imagers/owner_subscript.png',height: 62,width: 62,),
      Align(child:  Container(decoration: BoxDecoration(color: Color(0x88000000),borderRadius: BorderRadius.horizontal(left: Radius.circular(15))),
        height: 30,width:46 ,child: RichText(text: TextSpan(text: '$_currentIndex/',style:TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900,),
            children: [TextSpan(text:'${pagers.length}',style:TextStyle(fontSize: 10,color: Colors.white) )]))
        ,alignment: Alignment.center,),alignment: Alignment.bottomRight,)
    ],),);
  }
String s = 'sddsadsa';
  Widget _goodsSpecifications() {
 return StatefulBuilder(builder: (context,stat){
   return Container(height: 450,child: Column(children: <Widget>[
     Row(children: <Widget>[Padding(padding: EdgeInsets.only(top: 15,right: 15),child: GestureDetector(onTap: (){Navigator.pop(context);},child: Image.asset('assets/imagers/close.png'),),)],mainAxisAlignment: MainAxisAlignment.end,),
     Row(children: <Widget>[
      Padding(padding: EdgeInsets.only(left: 15,right: 15),child:  Image.asset('assets/imagers/goods_img_pop.png',height: 106,width: 106,),),
       Container(child: Column(mainAxisAlignment: MainAxisAlignment.start,children: <Widget>[
         Text.rich(TextSpan(style: TextStyle(color: Color(0xffcd1314),fontSize: 18),text: '¥',
             children:[TextSpan(text: '600',style: TextStyle(color: Color(0xffcd1314),fontSize: 25)),
             TextSpan(text: '.00',style: TextStyle(color: Color(0xffcd1314),fontSize: 18))] )),
         Text('库存：3841件')
       ],),height: 106,)
     ],),

     Expanded(child: ListView(children: _child(stat),padding: EdgeInsets.fromLTRB(15, 9, 15, 9) ,),flex: 1,),
     Padding(padding: EdgeInsets.fromLTRB(15, 5, 15, 5),child: GestureDetector(child:  Container(child: Text('确定',style: TextStyle(color: Colors.white,fontSize: 14),),
       alignment: Alignment.center,height: 36,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),color: Color(0xffcd1317)),),onTap: (){
       Navigator.pop(context);
       Navigator.push(context, MaterialPageRoute(builder: (context){
             return ConfirmOrder();

      }));

     },),)
   ],),decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),color: Colors.white));
 });

  }

  _child( Function stat) {
    List<Widget> wi = [];
    list.forEach((godsSelectInfo){
      wi.add( GestureDetector(onTap: (){
      },child: Text(godsSelectInfo.title,style: TextStyle(fontSize: 16,color: Color(0xff333333)),textAlign: TextAlign.left,),));
      wi.add(_item(stat,godsSelectInfo.infos));
    });
    wi.add(SizedBox(height: 29,));
   wi.add(Row(children: <Widget>[
     Text("数量",style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
     Expanded(flex: 1,child:  _addSize(),),
   ],));
    return wi;
  }
  String tv = '颜色';
   _item( Function stat, List<GoodsSelectInfo> infos) {
     List<Widget> childItem=[];
     infos.forEach((goodsSelectInfo){
       childItem.add(GestureDetector(child: _itemChild(goodsSelectInfo.sel, goodsSelectInfo.info),onTap: (){
         stat((){
           infos.forEach((g){
               g.sel = false;
           });
           goodsSelectInfo.sel = true;
         });
       },));
     });
    return Wrap(children: childItem,spacing: 19,);
   }

  _itemChild(bool sel,String info) {
    return Container(margin: EdgeInsets.only(top: 13),padding:EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Text(info,style: TextStyle(fontSize: 12,color: sel?Colors.white:Color(0xff333333)),),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: sel?Color(0xffcd1317):
      Colors.white,border: Border.fromBorderSide(BorderSide(color: sel?Colors.transparent:Color(0xff333333),width: 2))),);
  }
  getGoosDetailList(){
    List<GoodsSelectInfo> list = [];
    GoodsSelectInfo goodsSelectInfo = GoodsSelectInfo(title: '颜色',infos: [GoodsSelectInfo(info: '黑色',sel: true),GoodsSelectInfo(info: '白色',sel: false)]);
    GoodsSelectInfo goodsSelectInfo2 = GoodsSelectInfo(title: '尺寸',infos: [GoodsSelectInfo(info: 'M',sel: true),GoodsSelectInfo(info: 'L',sel: false)
    ,GoodsSelectInfo(info: 'XL',sel: false),GoodsSelectInfo(info: '2XL',sel: false)]);
    list.add(goodsSelectInfo);
    list.add(goodsSelectInfo2);
    return list;
  }

  _addSize() {
     return Row(
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
     );
  }
}
