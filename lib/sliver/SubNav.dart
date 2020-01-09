import 'package:flutter/material.dart';
import 'package:flutter_app/entity/home_pager_entity.dart';

import 'WebView.dart';

class SubNav extends StatelessWidget {
  final List<HomePagerSubnavlist> list;

  const SubNav({Key key, @required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadiusDirectional.circular(6)),
      padding: EdgeInsets.all(7),
      child: _items(context, list),
    );
  }

  _items(BuildContext context, List<HomePagerSubnavlist> list) {
    if (list == null) return null;
    int separate = (list.length / 2 + 0.5).toInt();
    List<Widget> items = [];
    list.forEach((item) {
      items.add(_item(context, item));
    });
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(separate, items.length),
          ),
        )
      ],
    );
  }

  Widget _item(BuildContext context, HomePagerSubnavlist item) {

    return Expanded(
      child:GestureDetector(child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            item.icon,
            height: 18,
            width: 18,
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WebView(
          url: 'https://www.baidu.com/',
          StatuBarColor:'0xff000000',
          hidAppBar: true,
          backForbid: true);
    }));
      },),flex: 1,

    );
  }
}
