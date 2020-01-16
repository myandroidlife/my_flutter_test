import 'package:flutter/material.dart';

class InputPass {
  BuildContext context;
  Function(String pass) callBack;
  showInputPass(Function(String pass) callBack) {
    return StatefulBuilder(builder: (context, stat) {
      this.context = context;
      this.callBack = callBack;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _passTitle(),
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
                Text(
                  '忘记密码？手机验证支付',
                  style: TextStyle(color: Color(0xff6196EF)),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 56, 6, 20),
            child: _passKeybord(stat),
          )
        ],
      );
    });
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
          child: Text(listPass[position] != '' ? showPass : '',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900,),textAlign: TextAlign.center,),
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
            _ImagerItem('',null),
            _numItem(0, stat),
            _ImagerItem('',stat),
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
      child:  RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        onPressed: () {
          stat(() {
            if (length >= 0 && length <= listPass.length - 1) {
              length = length + 1;
              listPass[length - 1] = '$b';
              if (length == listPass.length) {
                //输入完成
                callBack(listPass.toString().trim());
                for(int i = 0;i<listPass.length;i++){
                  listPass[i] = '';
                }
                length = 0;
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
      child: stat==null?SizedBox():Padding(
        padding: EdgeInsets.only(left: 3, right: 3),
        child:  RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Color(0xfff6f6f6),
          elevation: 0,
          onPressed: () {
           if(stat!=null){
             stat(() {
               if (length > 0 ) {
                 listPass[length-1]='';
                 length = length-1;
               }
             });
           }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child:Image.asset('assets/imagers/remove.png'),
            ),
          ),
        ),
      ),
    );
  }
}
