import 'package:flutter/material.dart';

import 'ModifyPasswordBox.dart';
import 'Widgets.dart';
import 'keybord_num.dart';

///修改密码
class ModifyPasswordActivity extends StatefulWidget {
  String btnText = '下一步';

  @override
  ModifyPasswordState createState() => ModifyPasswordState();
}

class ModifyPasswordState extends State<ModifyPasswordActivity> {
  NumPassword numPassword = null;//键盘
  Color btnColor = Color(0xff999999);//按钮颜色
  num currentIndex = 0;//当前的页面下标
  PageController pa;//pagerView控制器
  List<ModifyPasswordBox> passBoxs = null;//密码界面

  @override
  void initState() {
    if (numPassword == null) {
      numPassword = NumPassword();
    }
    if (passBoxs == null) {
      passBoxs = [
        ModifyPasswordBox(
          title: '请输入原密码',
          info: '为了提供更好的支付体验，宝励商城将使用6位纯数字密码进行支付',
          description: '避免使用连续或重复的数字，例如123456、888888\n避免使用身份证或银行卡内的数字',
        ),
        ModifyPasswordBox(
          title: '请输入新密码',
          info: '为了提供更好的支付体验，宝励商城将使用6位纯数字密码进行支付',
          description: '避免使用连续或重复的数字，例如123456、888888\n避免使用身份证或银行卡内的数字',
        ),
        ModifyPasswordBox(
          title: '确认新密码',
          info: '为了提供更好的支付体验，宝励商城将使用6位纯数字密码进行支付',
          description: '避免使用连续或重复的数字，例如123456、888888\n避免使用身份证或银行卡内的数字',
        ),
      ];
    }
    super.initState();
  }

  bool first = false;
  bool two = false;
  bool three = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.buildAppBar(context, '修改密码'),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pa = PageController(initialPage: 0),
              onPageChanged: (index) {
                currentIndex = index;
                print(index);
              },
              children: passBoxs,
            ),
          ),
          new MaterialButton(
            minWidth: MediaQuery.of(context).size.width - 80,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: btnColor,
            textColor: Colors.white,
            child: new Text(widget.btnText),
            onPressed: SubBtnOnPress,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: numPassword.passKeybord((s){
              KeybordCallback(s);
            }),
            color: Color(0xfffafafa),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }

  ///点击了自定义键盘回调
  KeybordCallback(num s) async {
      passBoxs[currentIndex].setPassword(s);
      for (int i = 0; i < 6; i++) {
        //还没输入完成，跳出
        if (passBoxs[currentIndex].getPass()[i] == '') {
          setState(() {});
          btnColor = Color(0xff999999);
          switch (currentIndex) {
            case 0:
              first = false;
              break;
            case 1:
              two = false;
              break;
            case 2:
              three = false;
              break;
          }
          return;
        }
      }
      //走到这里，说明输入完成
      btnColor = Color(0xffcd1317);
      switch (currentIndex) {
        case 0:
          first = true;
          break;
        case 1:
          two = true;
          break;
        case 2:
          three = true;
          break;
      }
      setState(() {});
  }

  ///点击提交按钮
  SubBtnOnPress () {
      if (currentIndex < 2 && btnColor != Color(0xff999999)) {
        currentIndex++;
        btnColor = Color(0xff999999);
        currentIndex == 2 ? widget.btnText = '确认修改' : widget.btnText = '下一步';
        pa.animateToPage(currentIndex,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        setState(() {});
      }
      if (three) {
        widget.btnText = "网络提交中";
        setState(() {});
      }
  }


}
