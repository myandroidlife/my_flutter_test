import 'package:flutter/material.dart';
import 'package:flutter_app/entity/home_pager_entity.dart';

import 'WebView.dart';

class LocalNav extends StatelessWidget {
  final List<HomePagerLocalnavlist> homePagerLocalnavlist;

  const LocalNav({Key key, this.homePagerLocalnavlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: _items(context),
    );
  }

  _items(BuildContext context) {
    if (homePagerLocalnavlist == null) return null;
    List<Widget> items = [];
    homePagerLocalnavlist.forEach((item) {
      items.add(_item(context, item));
    });
    return Row(
      children: items,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget _item(BuildContext context, HomePagerLocalnavlist item) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Image.network(
            item.icon,
            height: 32,
            width: 32,
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(
              url: item.url,
              StatuBarColor: item.statusBarColor,
              hidAppBar: item.hideAppBar,
              backForbid: item.hideAppBar);
        }));
      },
    );
  }
}
