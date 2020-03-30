import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

import 'entity/Items.dart';

class IncomeBaoLi extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IncomeBaoLiState();
  }
}

class IncomeBaoLiState extends State<IncomeBaoLi>
    with SingleTickerProviderStateMixin {
  TabController tab = TabController(length: 3, vsync: AnimatedListState());

  double height = 0;

  AnimationController controller;

  Animation<double> animation;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          height = animation.value;
          // the state that has changed here is the animation object’s value
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          '宝励豆',
          style: TextStyle(color: Color(0xff333333)),
        ),
        centerTitle: true,
        brightness: Brightness.light,
        leading: GestureDetector(
          child: Padding(
              padding: EdgeInsets.only(
                right: 20,
                left: 15,
                top: 10,
                bottom: 10,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff333333),
              )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _navgationPadding(),
          _tab(),
          SizedBox(height: 54,),
          Center(child: Text('冻结资金（元）',style: TextStyle(fontSize: 12,color: Color(0xff8c8c8c)),)),
          Center(child: Text('134.00',style: TextStyle(color: Color(0xff33c193),fontSize: 22,fontWeight: FontWeight.w900),)),
          SizedBox(height: 54,),
          Expanded(
              child: Stack(
                children: <Widget>[
                  TabBarView(
                    controller: tab,
                    children: <Widget>[
                      LogoApp(),
                      _ListView(),
                      Icon(Icons.directions_bike,
                          size: 128.0, color: Colors.black12),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("www"),
                    color: Colors.red,
                    height: height,
                  )
                ],
              ))
        ],
      ),
    );
  }

  GestureDetector _tab() {
    return GestureDetector(
      child: Padding(
        padding:
        EdgeInsets.only(left: 15, top: 12, bottom: 12, right: 50),
        child: Text('筛选'),
      ),
      onTap: () {
        controller?.forward(from: 0);
      },
    );
  }

  _navgationPadding() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 80, right: 80),
        child: TabBar(
          controller: tab,
          unselectedLabelColor: Colors.green,
          labelColor: Colors.red,
          indicatorColor: Color(0xffcd1317),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.0,
          tabs: <Widget>[
            Tab(
                icon: Text(
                  '全部',
                  style: TextStyle(fontSize: 14),
                )),
            Tab(
                icon: Text(
                  '收入',
                  style: TextStyle(fontSize: 14),
                )),
            Tab(
                icon: Text(
                  '支出',
                  style: TextStyle(fontSize: 14),
                )),
          ],
        ),
      ),
      color: Colors.white,
    );
  }

  showPop() {
    return // 下拉菜单头部
      GZXDropDownHeader(
        // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
        items: [
          GZXDropDownHeaderItem('菜单'),
        ],
        // GZXDropDownHeader对应第一父级Stack的key
        //stackKey: _stackKey,
        // controller用于控制menu的显示或隐藏
        // controller: _dropdownMenuController,
        // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
        onItemTap: (index) {
          if (index == 3) {}
        },
        // 头部的高度
        height: 40,
        // 头部背景颜色
        color: Colors.red,
        // 头部边框宽度
        borderWidth: 1,
        // 头部边框颜色
        borderColor: Color(0xFFeeede6),
        // 分割线高度
        dividerHeight: 20,
        // 分割线颜色
        dividerColor: Color(0xFFeeede6),
        // 文字样式
        style: TextStyle(color: Color(0xFF666666), fontSize: 13),
        // 下拉时文字样式
        dropDownStyle: TextStyle(
          fontSize: 13,
          color: Theme.of(context).primaryColor,
        ),
        // 图标大小
        iconSize: 20,
        // 图标颜色`
        iconColor: Color(0xFFafada7),
        // 下拉时图标颜色
        iconDropDownColor: Theme.of(context).primaryColor,
      );
  }

  _ListView() {
    return ListView.builder(itemBuilder: (context,index){
      return Items.getInfoItem(context);
    },itemCount: 10,);
  }
}

class LogoApp extends StatefulWidget {
  int a = 3;
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: new FlutterLogo(),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }

}
