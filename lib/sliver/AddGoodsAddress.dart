import 'package:flutter/material.dart';
import 'package:flutter_app/entity/Items.dart';

import '../refresh.dart';
import 'Goods_car.dart';
import 'Widgets.dart';

class AddGoodsAddress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddGoodsAddressState();
  } //添加地址

}

class AddGoodsAddressState extends State<AddGoodsAddress> {
  GlobalKey<FormState> _inputKey = new GlobalKey<FormState>();

  var isCheck =false;
  String name;
  String phone;
  String address;
  String postcode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.buildAppBar(context, '新增地址'),
      body: ListView(
        children: <Widget>[_subContent(context),
        SizedBox(height: 10,),
        PhysicalModel(borderRadius: BorderRadius.circular(15),color: Colors.white,child: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),child: Row(children: <Widget>[
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
          Text('设为默认地址')
        ],),),)],
      ),
      bottomNavigationBar: subBtn(context),
    );
  }

  Container subBtn(BuildContext context) {
    return Container(height: 60,child: Padding(padding: EdgeInsets.fromLTRB(15, 7, 7, 15),child: Row(children: <Widget>[

      Expanded(child:GestureDetector(child:  Container(child: Text('保存并使用',style: TextStyle(color: Colors.white,fontSize: 14),),
        alignment: Alignment.center,height: 36,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),color: Color(0xffcd1317)),),onTap: (){
      _forSubmitted();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Refresh();
      }));
      },),flex: 1,)
    ],),),color: Colors.white,);
  }

  _subContent(BuildContext context) {
    return Form(
      child:PhysicalModel(color: Colors.white,child:  Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            _input('收货人姓名', '请输入姓名', (content) {
              name = content;
            }),
            Container(height: 1,color: Colors.grey,),
            _input('手机号码', '请输入手机号码', (content) {
              phone = content;

            }),
            Container(height: 1,color: Colors.grey,),
            GestureDetector(child:  ListTile(title: Text('所在地区'),contentPadding: EdgeInsets.only(left: 0),trailing: Icon(Icons.keyboard_arrow_right),),onTap: (){
              showModalBottomSheet(context: context, builder: (context){
                return Text('-----');
              });
            },),
            Container(height: 1,color: Colors.grey,),
            _input('街道地址', '请输入街道地址', (content) {
              address = content;
            }),
            Container(height: 1,color: Colors.grey,),
            _input('邮政编码', '请输入邮政编码', (content) {
              postcode = content;
            }),
          ],
        ),
      ),borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),),
      key: _inputKey,
    );
  }

  void _forSubmitted() {
    var _form = _inputKey.currentState;

    if (_form.validate()) {
      _form.save();
    }
    print(name+phone+address+postcode);

  }

  _input(String title, String hintText, Function(String content) saveContent) {
    return Padding(padding: EdgeInsets.only(top: 7,bottom: 7),child: Row(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Color(0xff333333)),
        ),
        SizedBox(
          width: 13,
        ),
        Expanded(
            child: TextFormField(
              onSaved: saveContent,
              maxLines: 1,
              decoration: InputDecoration(
                  hintMaxLines: 1, hintText: hintText, border: InputBorder.none),
            ))
      ],
    ),);
  }
}
