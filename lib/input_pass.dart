import 'dart:async';

import 'package:flutter/material.dart';

int currentIndex = 0;
class InputPassWight extends StatefulWidget{
 final Function(String pass) callBack;

  const InputPassWight({Key key, this.callBack}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return InputPassWightStat();
  }
}

class InputPassWightStat extends State<InputPassWight>{
  InputPass input = InputPass();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return input.showInputPass(widget.callBack);
  }
}
class InputPass{
  BuildContext context;
  Function(String pass) callBack;

  PageController pa;
  showInputPass(Function(String pass) callBack) {
    currentIndex = 0;
    return StatefulBuilder(builder: (context, stat) {
      this.context = context;
      this.callBack = callBack;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _passTitle(),
          Container(
            height: 134,
            child: PageView(
//              physics: NeverScrollableScrollPhysics(),
              controller:  pa= PageController(initialPage: 0),
              onPageChanged: (index) {
                currentIndex = index;
                print(index);
              },
              children: <Widget>[_pagerPass(stat), forgetPassword(stat)],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 10, 6, 20),
            child: _passKeybord(stat),
          )
        ],
      );
    });
  }

  Padding forgetPassword(Function stat) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '请输入手机号',
            style: TextStyle(fontSize: 24, color: Color(0xff333333)),
          ),
          Row(children: <Widget>[
            Expanded(child: Text('18306074517'),),
            Container(width: 1,color: Colors.grey,height: 35,),
            RaisedButton(onPressed: (){reGetCountdown(stat);},child: Text(_codeCountdownStr),color: Color(0xfff6f6f6),elevation: 0,)
          ],),
          Container(height: 1,color: Colors.grey,),
          _codeInfo(6)
        ],
      ),
    );
  }

  _passBorde(int size, String showPass) {
    List<Widget> passborde = [];
    for (int i = 0; i < size; i++) {
      passborde.add(_passItem(showPass, size, i));
    }
    return Row(
      children: passborde,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';
  int _countdownNum = 59;

  void reGetCountdown(Function setState) {

    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '${_countdownNum--}重新获取';
      _countdownTimer =
      new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}重新获取';
          } else {
            _codeCountdownStr = '获取验证码';
            _countdownNum = 59;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }
  Padding _passTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 44),
      child: Stack(
        children: <Widget>[
          Icon(Icons.arrow_back_ios),
          Center(
            child: Text(
              '支付密码',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  List<String> listPass = [
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int length = 0;

  Widget _passItem(String showPass, int size, int position) {
    var bord = BorderSide(color: Color(0xffe2e2e2), width: 1);
    var bordr = BorderSide(color: Color(0xffe2e2e2), width: 0);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: bord,
                top: bord,
                right: position == size - 1 ? bord : bordr,
                bottom: bord)),
        child: Center(
          child: Text(
            listPass[position] != '' ? showPass : '',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        height: 50,
      ),
      flex: 1,
    );
  }

  //创建键盘
  _passKeybord(Function stat) {
    return Column(
      children: <Widget>[
        _RowNum([1, 2, 3], stat),
        SizedBox(
          height: 7,
        ),
        _RowNum([4, 5, 6], stat),
        SizedBox(
          height: 7,
        ),
        _RowNum([7, 8, 9], stat),
        SizedBox(
          height: 7,
        ),
        Row(
          children: <Widget>[
            _ImagerItem('', null),
            _numItem(0, stat),
            _ImagerItem('', stat),
          ],
        )
      ],
    );
  }

  _RowNum(List<num> list, Function stat) {
    List<Widget> a = [];
    list.forEach((b) {
      a.add(_numItem(b, stat));
    });
    return Row(
      children: a,
    );
  }

  _numItem(num b, Function stat) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 3, right: 3),
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Colors.white,
          onPressed: () {
            stat(() {
              if(currentIndex==0){
                if (length >= 0 && length <= listPass.length - 1) {
                  length = length + 1;
                  listPass[length - 1] = '$b';
                  if (length == listPass.length) {
                    //输入完成
                    callBack(listPass.toString().trim());
                    for (int i = 0; i < listPass.length; i++) {
                      listPass[i] = '';
                    }
                    length = 0;
                    Navigator.pop(context);
                  }
                }
              }else if(currentIndex==1){
                if (codeSize >= 0 && codeSize <= codes.length - 1) {
                  codeSize++;
                  codes[codeSize-1] = '$b';
                }
                if (codeSize == codes.length) {
                  //输入完成
                  callBack(codes.toString().trim());
                  for (int i = 0; i < codes.length; i++) {
                    codes[i] = '';
                  }
                  codeSize = 0;
                  Navigator.pop(context);
                }
              }

            });
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                '$b',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _ImagerItem(String s, Function stat) {
    return Expanded(
      child: stat == null
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.only(left: 3, right: 3),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color(0xfff6f6f6),
                elevation: 0,
                onPressed: () {
                  if (stat != null) {
                    stat(() {
                      if (length > 0) {
                        listPass[length - 1] = '';
                        length = length - 1;
                      }
                    });
                  }
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Image.asset('assets/imagers/remove.png'),
                  ),
                ),
              ),
            ),
    );
  }

  _pagerPass( Function stat) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: _passBorde(6, '＊'),
        ),
        SizedBox(
          height: 13,
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
             GestureDetector(child:  Text(
               '忘记密码？手机验证支付',
               style: TextStyle(color: Color(0xff6196EF)),
             ),onTap: (){
               pa?.jumpToPage(1);
               },)
            ],
          ),
        ),
      ],
    );
  }

  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
  }
  //横线验证码
  List<String> codes=[];
  int codeSize = 0;
  _codeInfo(int size) {
   List<Widget> _items=[];
   for(int i =0;i<size;i++){
     if(codes.length<size){
       codes.add('');
     }
     _items.add(_item(i));
   }
   return Row(children: _items,mainAxisAlignment: MainAxisAlignment.spaceBetween,);
  }

  Widget _item(int position) {
  return  Expanded(child: Column(children: <Widget>[
    SizedBox(height: 15,),
    Text(codes[position],style: TextStyle(fontSize: 24),),
    Padding(padding: EdgeInsets.only(left: 8,right: 8,top: 9),child: Container(height: 1,color: position==codeSize?Colors.blue:Colors.grey,),)
  ],mainAxisAlignment: MainAxisAlignment.center,));
  }


}
