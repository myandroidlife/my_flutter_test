import 'package:flutter/material.dart';

import 'entity/Items.dart';
class ConfirmOrder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ConfirmOrderStat();
  }
}

class ConfirmOrderStat extends State<ConfirmOrder>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context,'确认订单')
    ,body: ListView(padding: EdgeInsets.only(left: 9,right: 9),children: <Widget>[
        SizedBox(height: 10,),
        Items.addressItem(context),
        SizedBox(height: 10,),
        Items.goodsInfoItem(context),
        SizedBox(height: 10,),
        _getGoodsMec(),
      ],),);
  }



  static AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
    backgroundColor: Colors.white,
    title: Text(title,style: TextStyle(color: Color(0xff333333)),),
    centerTitle: true,
    brightness: Brightness.light,
    leading: GestureDetector(child: Icon(
      Icons.arrow_back_ios,
      color:  Color(0xff333333),
    ),onTap: (){
      Navigator.pop(context);
    },),
  );
  }
 int selectMec;//选择的拿货方式
  bool getGoodsMec = false;
  _getGoodsMec() {
    List<Widget> getGoodsMecItem = [];
    var select = PhysicalModel(color: Colors.white,borderRadius: BorderRadius.circular(6),child:Padding(padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(title:Text( '选择拿货方式：'), contentPadding: EdgeInsets.all(0),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
          showModalBottomSheet(useRootNavigator: true,isScrollControlled: true,context: context, builder: (context){
            return _select(context);
          },backgroundColor: Colors.transparent);
        },)
      ],)));
    getGoodsMecItem.add(select);
    if(selectMec!=null&&selectMec==2){
      var select2 = PhysicalModel(color: Colors.white,borderRadius: BorderRadius.circular(6),child:Padding(padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(children: <Widget>[
           Column(children: <Widget>[
             Text('门店编号（必填）'),
             TextField(decoration: InputDecoration(hintText: "shuru "),)
           ],)
          ],),));
      getGoodsMecItem.add(SizedBox(height: 10,));
      getGoodsMecItem.add(select2);
    }
    return Column(children: getGoodsMecItem,);
  }
  //选择拿货方式
  _select(BuildContext context) {
    return StatefulBuilder(builder: (context,stat){
      return Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
        child:Column(mainAxisSize: MainAxisSize.min,children: <Widget>[
          ListTile(title: Text('选择拿货方式'),trailing: Image.asset('assets/imagers/close.png'),onTap: (){
            Navigator.pop(context);
          },),
          ListTile(title: Text('总公司'),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
              stat((){
                setState(() {
                  selectMec = 1;
                  getGoodsMec = true;
                });
              });
          },),
          ListTile(title: Text('专卖店'),trailing: Icon(Icons.keyboard_arrow_right),onTap: (){
            stat((){
              setState(() {
                selectMec = 2;
                getGoodsMec = true;
              });
            });
          },),
        ],) ,);
    },);
  }
}