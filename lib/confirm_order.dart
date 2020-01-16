import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/sliver/Goods_car.dart';
import 'package:flutter_app/sliver/SelectPayMec.dart';
import 'package:flutter_app/sliver/Widgets.dart';

import 'EditText.dart';
import 'entity/Items.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConfirmOrderStat();
  }
}

class ConfirmOrderStat extends State<ConfirmOrder> {
  var controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.buildAppBar(context, '确认订单'),
      body: ListView(
        padding: EdgeInsets.only(left: 9, right: 9),
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Items.addressItem(context),
          SizedBox(
            height: 10,
          ),
          Items.goodsInfoItem(context),
          SizedBox(
            height: 10,
          ),
          _getGoodsMec(),
          SizedBox(
            height: 10,
          ),
          _upgrade(),
          SizedBox(
            height: 10,
          ),
          _selfGet(),//自己提取
          SizedBox(
            height: 10,
          ),
          _goodsMonety(),
          SizedBox(
            height: 10,
          ),
        ],
      ),
        bottomNavigationBar: Container(height: 60,child: Padding(padding: EdgeInsets.fromLTRB(15, 7, 7, 15),child: Row(children: <Widget>[

      Expanded(child:GestureDetector(child:  Container(child: Text('立即支付',style: TextStyle(color: Colors.white,fontSize: 14),),
        alignment: Alignment.center,height: 36,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),color: Color(0xffcd1317)),),onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return SelectPayMec();
}));
      },),flex: 1,)
    ],),),color: Colors.white,),
    );
  }



  int selectMec; //选择的拿货方式
  bool getGoodsMec = false;

  _getGoodsMec() {
    List<Widget> getGoodsMecItem = [];
    List<Widget> getGoodsMecItem1 = [
      ListTile(
        title: Text(
            '选择拿货方式：${selectMec != null && selectMec == 1 ? "（总公司）" : "（专卖店）"}'),
        contentPadding: EdgeInsets.all(0),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          showModalBottomSheet(
              useRootNavigator: true,
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return _select(context);
              },
              backgroundColor: Colors.transparent);
        },
      )
    ];
    if (selectMec != null && selectMec == 2) {
      getGoodsMecItem1.add(_input());
    }
    var select2;
    var select = PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: getGoodsMecItem1,
            )));
    getGoodsMecItem.add(select);
    if (selectMec != null && selectMec == 2) {
      select2 = PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('门店编号（必填）'),
                    SizedBox(
                      height: 24,
                    ),
                   _upgradeInput('请输入门店编号')
                  ],
                )
              ],
            ),
          ));
      getGoodsMecItem.add(SizedBox(
        height: 10,
      ));
      getGoodsMecItem.add(select2);
    } else {
      if (getGoodsMecItem.contains(select2)) {
        getGoodsMecItem.removeAt(select2);
      }
    }
    return Column(
      children: getGoodsMecItem,
    );
  }

  //选择拿货方式
  _select(BuildContext context) {
    return StatefulBuilder(
      builder: (context, stat) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('选择拿货方式'),
                trailing: Image.asset('assets/imagers/close.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('总公司'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  stat(() {
                    setState(() {
                      selectMec = 1;
                      getGoodsMec = true;
                    });
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('专卖店'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  stat(() {
                    setState(() {
                      selectMec = 2;
                      getGoodsMec = true;
                    });
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _input() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '关键字：门店名称、申请人姓名、联系电话、省、市、区',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 24,
            ),
            _upgradeInput('请输入关键字')
          ],
        )
      ],
    );
  }

  //升级输入框
  _upgradeInput(String hint) {
    return Container(
      height: 25,
      width: MediaQuery.of(context).size.width -
          26 * MediaQuery.of(context).devicePixelRatio,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, -15, 5, 0),
                  hintText: hint,
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              controller: controller,
              // maxLength: 30,//最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
              maxLines: 1,
              //最大行数
              autocorrect: true,
              //是否自动更正
              autofocus: false,
              //是否自动对焦
              obscureText: false,
              //是否是密码
              textAlign: TextAlign.start,
              //文本对齐方式
              style: TextStyle(fontSize: 16.0, color: Color(0xff333333)),
              //输入文本的样式
              //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],//允许的输入格式
              onChanged: (text) {
                //内容改变的回调
                print('change $text');
              },
              onSubmitted: (text) {
                //内容提交(按回车)的回调
                print('submit $text');
              },
              enabled: true, //是否禁用
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
  int upSelf ;//1自己，2带他人
  _upgrade() {
    List<Widget> upList=[];
    upList.add( ListTile(
      title: Text('升级方式${upSelf!=null&&upSelf==1?"（本人升级）":'（代他人升级）'}'),
      contentPadding: EdgeInsets.all(0),
      trailing: Row(mainAxisSize: MainAxisSize.min,children: <Widget>[Text(upSelf!=null?'更换升级方式':''),Icon(Icons.keyboard_arrow_right)],),
      onTap: () {
        showModalBottomSheet(
            useRootNavigator: true,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return _upgradePop(context);
            },
            backgroundColor: Colors.transparent);
      },
    ));
    if(upSelf!=null){
      if(upSelf==1){
        upList.add(_upgradeInput('请输入邀请码'));
        upList.add( SizedBox(
          height: 24,
        ),);
      }

      upList.add(_upgradeInput('请输入姓名'));
      upList.add( SizedBox(
        height: 24,
      ),);
      upList.add(_upgradeInput('请输入手机号'));
    }
    return PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 5, 16, upSelf!=null?15:5),//如果选择了升级方式，增大边距
          child:Column(children: upList,),
        ));
  }

//选择升级方式
  _upgradePop(BuildContext context) {
    return StatefulBuilder(
      builder: (context, stat) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text('升级方式'),
                trailing: Image.asset('assets/imagers/close.png'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('本人升级'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  stat(() {
                    upSelf=1;
                    setState(() {

                    });
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('代他人升级'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  stat(() {
                    upSelf=2;
                    setState(() {

                    });
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
 bool isCheck = false;
  _selfGet() {
    return PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        child:ListTile(title: Text('是否自提'),trailing: RoundCheckBox(
          isSelect: isCheck,
          selectIcon: 'assets/imagers/check.png',
          unSelectIcon: 'assets/imagers/un_check.png',
          oncheck: (check) {
            setState(() {
              isCheck = !isCheck;
            });
          },
        ),),
        );
  }
  _goodsMonety() {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      child:Padding(padding: EdgeInsets.fromLTRB(15, 17, 15, 17),child: Column(children: <Widget>[
        Row(children: <Widget>[
          Expanded(child: Text('商品总额',style: TextStyle(fontSize: 16),),flex: 1,),
          Text('¥600.00',style: TextStyle(fontSize: 16,color: Color(0xffcd1317)),)
        ],),
        SizedBox(height: 10,),
        Row(children: <Widget>[
          Expanded(child: Text('运费',style: TextStyle(fontSize: 14),),flex: 1,),
          Text('¥+0.00',style: TextStyle(fontSize: 14,color: Color(0xffcd1317)),)
        ],)
      ],),));
  }
}
