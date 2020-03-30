import 'package:flutter/material.dart';
import 'package:flutter_app/entity/Items.dart';

class TimeLimitActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeLimitStat();
  }
}

class TimeLimitStat extends State<TimeLimitActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomScrollView(
              slivers: <Widget>[_buildAppbar(context), _like(), _itemGoods()]),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 76, 15, 0),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xfff4f4f4),
              child: SizedBox(
                height: 30,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/imagers/search.png',
                      height: 14,
                      width: 14,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '请输入你想要搜索的内容',
                      style: TextStyle(color: Color(0xff8e8e93)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return SliverAppBar(
      floating: false,
      pinned: true,
      snap: false,
      bottom: Bottoms(),
      expandedHeight: 268,
      leading: GestureDetector(
        child: Icon(Icons.backspace),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Center(
        child: Text('限时购'),
      ),
      actions: <Widget>[
        IconButton(
            icon: Image.asset('assets/imagers/message.png'),
            onPressed: () {
              print('消息');
            })
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'assets/imagers/limit_bg.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  _itemGoods() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        childAspectRatio: 175 / 262, //子控件宽高比
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Items.getGoodItem(context, index, Items.goods[index]);
      }, childCount: Items.goods.length),
    );
  }

  _like() {
    return SliverList(
        delegate: SliverChildListDelegate([
      Container(
        padding: EdgeInsets.only(top: 20, bottom: 10),
        color: Color(0xfff4f4f4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '------ 复消精品 ------',
              style: TextStyle(fontSize: 16, color: Color(0xff333333)),
            )
          ],
        ),
      )
    ]));
  }
}

///底部间距
class Bottoms extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomsStat();
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}

class BottomsStat extends State<Bottoms> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
