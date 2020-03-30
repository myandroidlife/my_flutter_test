import 'package:flutter/material.dart';

import '../input_pass.dart';
import 'Goods_car.dart';
import 'Widgets.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
class SelectPayMec extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SelectPayMecStat();
  }
}

class SelectPayMecStat extends State<SelectPayMec> {
  bool sel = false;
  bool banlence_payment = false; //余额
  bool baoli = false; //保利
  bool wx = false; //
  bool ali = false;
  String passWord = '无';
  InputPass inputPass; //
  @override
  void initState() {
     inputPass = InputPass();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.buildAppBar(context, '支付方式'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMoneySize(),
          _buildInfoTitle('宝励支付'),
          _baoLiPay(),
          _buildInfoTitle('其他支付'),
          _addRoundBg(Column(
            children: <Widget>[
              _selectItem('wx', '微信支付', '余额：', '¥560.00'),
              SizedBox(
                height: 18,
              ),
              _selectItem('ali', '支付宝支付', '余额：', '¥560.00')
            ],
          )),
          Text(passWord)
        ],
      ),
      bottomNavigationBar: buildSubmitBtn(context),
    );
  }

  Container buildSubmitBtn(BuildContext context) {
    return Container(
      height: 60,
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 7, 7, 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                child: Container(
                  child: Text(
                    '立即支付¥600.00',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  alignment: Alignment.center,
                  height: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Color(0xffcd1317)),
                ),
                onTap: () {
                  _showPasswordInput(context);
                },
              ),
              flex: 1,
            )
          ],
        ),
      ),
      color: Colors.white,
    );
  }

  Padding _buildInfoTitle(String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
      ),
    );
  }

  Container _buildMoneySize() => Container(
        color: Colors.white,
        child: Center(
          child: Text(
            '¥600.00',
            style: TextStyle(fontSize: 16, color: Color(0xffcd1317)),
          ),
        ),
        padding: EdgeInsets.only(top: 19, bottom: 19),
      );

  _selectItem(String icon, String name, String childName, String money) {
    return Row(
      children: <Widget>[
        Image.asset('assets/imagers/$icon.png'),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            name,
            style: TextStyle(fontSize: 16, color: Color(0xff333333)),
          ),
          flex: 1,
        ),
        Text(
          childName,
          style: TextStyle(fontSize: 14, color: Color(0xff999999)),
        ),
        Text(
          money,
          style: TextStyle(fontSize: 14, color: Color(0xff333333)),
        ),
        RoundCheckBox(
          isSelect: name.endsWith('余额支付')
              ? banlence_payment
              : name.endsWith('宝励豆支付')
                  ? baoli
                  : name.endsWith('微信支付')
                      ? wx
                      : name.endsWith('支付宝支付') ? ali : false,
          selectIcon: 'assets/imagers/check.png',
          unSelectIcon: 'assets/imagers/un_check.png',
          oncheck: (check) {
            setState(() {
              switch (name) {
                case '余额支付':
                  banlence_payment = !banlence_payment;
                  if (banlence_payment) {
                    wx = false;
                    ali = false;
                  }
                  break;
                case '宝励豆支付':
                  baoli = !baoli;
                  if (baoli) {
                    wx = false;
                    ali = false;
                  }
                  break;
                case '微信支付':
                  wx = !wx;
                  if (wx) {
                    banlence_payment = false;
                    baoli = false;
                    ali = false;
                  }
                  break;
                case '支付宝支付':
                  ali = !ali;
                  if (ali) {
                    banlence_payment = false;
                    baoli = false;
                    wx = false;
                  }
                  break;
              }
            });
          },
        )
      ],
    );
  }

  _addRoundBg(Widget childs) {
    return Padding(
      padding: EdgeInsets.only(left: 9, right: 9),
      child: PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 17, 15, 17),
            child: childs,
          )),
    );
  }

  _baoLiPay() {
    if (banlence_payment == false || baoli == false) {
      return _addRoundBg(Column(
        children: <Widget>[
          _selectItem('banlence_payment', '余额支付', '余额：', '¥560.00'),
          SizedBox(
            height: 18,
          ),
          _selectItem('baoli', '宝励豆支付', '余额：', '¥560.00')
        ],
      ));
    }
    if (banlence_payment == true && baoli == true) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              _addRoundBg(
                  _selectItem('banlence_payment', '余额支付', '余额：', '¥560.00')),
              SizedBox(
                height: 18,
              ),
              _addRoundBg(_selectItem('baoli', '宝励豆支付', '余额：', '¥560.00')),
            ],
          ),
          Image.asset('assets/imagers/pay_add.png')
        ],
      );
    }
  }

  void _showPasswordInput(BuildContext context) {
    showModalBottomSheet(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          fluwx.registerWxApi(appId:"wxd930ea5d5a258f4f",universalLink:"https://your.univeral.link.com/placeholder/");
          return InputPassWight(callBack: (pass){
            fluwx.pay( appId: 'wxd930ea5d5a258f4f',
                partnerId: '1900000109',
                prepayId: '1101000000140415649af9fc314aa427',
                packageValue: 'Sign=WXPay',
                nonceStr: '1101000000140429eb40476f8896f4c9',
                timeStamp: 1398746574,
                sign: '7FFECB600D7157C5AA49810D2D8F28BC2811827B',
                signType: '选填',
                extData: '选填'
            );
            setState(() {
              passWord = pass;
            });
          },);
        },
        backgroundColor: Color(0xfff4f4f4));
  }



  /**
   * 密码输入框
   */

}
