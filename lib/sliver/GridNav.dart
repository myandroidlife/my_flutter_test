import 'package:flutter/material.dart';
import 'package:flutter_app/entity/home_pager_entity.dart';

import 'WebView.dart';

class GridNav extends StatelessWidget {
  final HomePagerGridnav gridnav;

  const GridNav({Key key, @required this.gridnav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
      child: PhysicalModel(
        color: Colors.transparent,
        child: Column(
          children: _gridNavitems(context),
        ),
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias,
      ),
    );
  }

  //所有列items
  _gridNavitems(BuildContext context) {
    List<Widget> items = [];
    if (gridnav == null) return items;
    if (gridnav.hotel != null) {
      //
      items.add(_gridNavItem(context, gridnav.hotel, true));
    }
    items.add(SizedBox(
      height: 3,
    ));
    if (gridnav.flight != null) {
      //机票
      items.add(_gridNavItem(context, gridnav.flight, false));
    }
    items.add(SizedBox(
      height: 3,
    ));
    if (gridnav.travel != null) {
      //旅行
      items.add(_gridNavItem(context, gridnav.travel, false));
    }
    return items;
  }

  // 子条目
  _gridNavItem(
      BuildContext context, HomePagerGridnavFlight mode, bool isFirst) {
    List<Widget> items = [];
    items.add(_mainItem(context, mode));
    items.add(_doubleItem(context, mode, true));
    items.add(_doubleItem(context, mode, false));
    List<Widget> enpandItems = [];
    items.forEach((item) {
      enpandItems.add(Expanded(
        child: item,
        flex: 1,
      ));
    });
    Color statColor = Color(int.parse('0xff' + mode.startColor));
    Color endColor = Color(int.parse('0xff' + mode.endColor));
    return Container(
      height: 88,
      margin: isFirst ? null : EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [statColor, endColor])),
      child: Row(
        children: enpandItems,
      ),
    );
  }

  //左侧item
  Widget _mainItem(BuildContext context, HomePagerGridnavFlight mode) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(
              url: mode.mainItem.url,
              StatuBarColor: mode.startColor,
              hidAppBar: true,
              backForbid: true);
        }));
      },
      child: Stack(
        children: <Widget>[
          Image.network(
            mode.mainItem.icon,
            height: 88,
            width: 121,
            fit: BoxFit.contain,
            alignment: AlignmentDirectional.bottomEnd,
          ),
          Align(
            child: Text(
              mode.mainItem.title,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            alignment: AlignmentDirectional.center,
          ),
        ],
      ),
    );
  }

  //小item
  Widget _doubleItem(
      BuildContext context, HomePagerGridnavFlight mode, bool centItem) {
    return Column(children: <Widget>[
      Expanded(
        child: _item(context, mode.item1, true, true),
      ),
      Expanded(
        child: _item(context, mode.item1, false, true),
      )
    ]);
  }

  _item(BuildContext context, HomePagerGridnavFlightItem1 item, bool isFirst,
      bool centItem) {
    var bord = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border(left: bord, bottom: isFirst ? bord : BorderSide.none)),
        child: Center(
          child: Text(
            item.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
