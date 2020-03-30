import 'package:flutter/material.dart';
class NumPassword{
  passKeybord(Function stat) {
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
            stat(b);
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
              stat(-1);
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
}