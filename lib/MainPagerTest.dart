import 'package:camera/camera.dart';
import 'package:camera/new/src/support_android/camera.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/sliver/Goods_car.dart';
import 'package:flutter_app/sliver/SliverPager.dart';
import 'package:flutter_app/sliver/WaterfallsFlowPager.dart';
import 'package:flutter_app/sliver/XieChenHomePager.dart';
import 'package:flutter_app/sliver/classification/classification_classification.dart';
import 'dart:ui';
import 'caTest.dart';
import 'ca.dart';
import 'package:flutter_app/sliver/refresh.dart';

import 'Become_a_shop_owner.dart';
import 'Carmera.dart';
import 'MyPager.dart';

class MainPagers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      title: "宝励首页",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xffcd1317)),
      home: MainPagersWidget(),
    );
  }
}

class MainPagersWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPagersStat();
    ;
  }
}

class MainPagersStat extends State<MainPagersWidget> {
  final _bottomNavigationColor = Color(0xffcd1317);
  int _currentIndex = 0;
  List<Widget> pages = List<Widget>();
  List<String> _list = List();
  ScrollController _scrollController = new ScrollController();
  Router router = new Router();

  double magingRight = 15;

  double defaultAppBarHeight = 56;

  SearchWidget search;

  @override
  void initState() {
    pages.add(HomeScreen());
    pages.add(HomeScreen());
    pages.add(HomeScreen());
    pages.add(HomeScreen());
    pages.add(HomeScreen());
    super.initState();
    _scrollController.addListener(() {
      var position = _scrollController.position;
      // 小于50px时，触发上拉加载；
      if (position.maxScrollExtent - position.pixels < 50) {
        _loadMore();
      }
    });
    _generateData();
  }

  Future<void> _onRefresh() async {
    print("RefreshListPage _onRefresh()");
    await Future.delayed(Duration(seconds: 2), () {
      _list = List.generate(15, (i) => "我是刷新出的数据${i}");
      setState(() {});
    });
  }

  void _generateData() async {
    await Future.delayed(Duration(seconds: 2), () {
      print("RefreshListPage _generateData()");
      _list = List.generate(20, (i) => "我是初始化的数据${i}");
      setState(() {});
    });
  }

  bool isLoading = false;

  void _loadMore() async {
    print("RefreshListPage _loadMore()");
    if (!isLoading) {
      isLoading = true;
      setState(() {});
      Future.delayed(Duration(seconds: 3), () {
        print("RefreshListPage isLoading = ${isLoading}");
        isLoading = false;
        _list = List.from(_list);
        _list.addAll(List.generate(10, (index) => "上拉加载个数${index}"));
        setState(() {});
      });
    }
  }

  Widget _getRow(BuildContext context, int index) {
    if (index < _list.length) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 2,
            ),
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(
                'http://file02.16sucai.com/d/file/2014/1006/e94e4f70870be76a018dff428306c5a3.jpg',
                fit: BoxFit.cover,
                height: 175,
              ),
            ),
            Container(
              child: Text(
                '丹尼尔惠灵顿（Danielwellington）...',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
              padding: EdgeInsets.fromLTRB(8, 10, 8, 12),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
              child: Text(
                "¥1298.00",
                style: TextStyle(fontSize: 12, color: Color(0xffcd1317)),
              ),
            )
          ],
        ),
      );
    }
    return _getMoreWidget();
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("RefreshListPage _dispose()");
    _scrollController?.dispose();
    super.dispose();
  }

  double MAX_OFFSET = 80; //最大滚动范围
  double MAX_MAGING = 70; //最大右侧距离
  double APP_BAR_HEIGHT = 56;//appBar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 0
          ? Stack(
              children: <Widget>[
                SliverTestPager((double offsets) {
                 double offset = offsets>MAX_OFFSET?MAX_OFFSET:offsets;
                  if (offset >= 0 && offset <= MAX_OFFSET) {
                    setState(() {
                      magingRight = MAX_MAGING / MAX_OFFSET * offset+15;
                      double ma = APP_BAR_HEIGHT- APP_BAR_HEIGHT/MAX_OFFSET*offset+(APP_BAR_HEIGHT-36)/2;
                     defaultAppBarHeight = ma>56?56:ma;
                    });
                  }

                }),
                Align(
                  child: Padding(
                    padding: EdgeInsets.only(right: magingRight,left: 15),
                    child:  search= SearchWidget(defaultAppBarHeight: defaultAppBarHeight,),
                  ),
                  alignment: Alignment.topCenter,
                )
              ],
            )
          : _currentIndex == 1
              ? Classification()
              : _currentIndex == 2
                  ? GoodsCar()
                  : _currentIndex == 3 ? BecomeAShopOwner() : MyPager(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          _navIten(0),
          _navIten(1),
          _navIten(2),
          _navIten(3),
          _navIten(4),

        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _statPager,
        child: Icon(Icons.star_half),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              color: Color(0xffcd1317),
              child: Center(
                child: ClipOval(
                  //圆角图片
                  child: Image.network(
                    'http://b-ssl.duitang.com/uploads/item/201410/09/20141009224754_AswrQ.jpeg',
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
            ),
            UserAccountsDrawerHeader(
                accountName: Text("宝励用户"),
                accountEmail: Text("896377425@qq.com"))
          ],
        ),
      ),
    );
  }
//灰色
  List<String> titles = ['首页','成为店主','分类','购物车','我的'];
  List<String> mIconDoctorsIds = [  'icon_home_page', 'icon_shop_owner', 'icon_class', 'icon_shop_car', 'icon_my'];
  List<String> mIconDoctorsSelectIds = [  'icon_home_pages', 'icon_shop_owners', 'icon_classs', 'icon_shop_cars', 'icon_mys'];

  void _statPager() {
//    var bodyJson = '{"user":1281,"pass":3041}';
//    router.navigateTo(context, '/home/$bodyJson')
    cameras();
//    Navigator.of(context).push(MaterialPageRoute(
//        builder: (context) => SliverTestPager(null)));
  }
  Future<void> cameras() async {
    List<CameraDescription> cameras = await availableCameras();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomeContent(camera: cameras[0],)));
  }
  buildWeight() {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        brightness: Brightness.dark,
        actions: <Widget>[Icon(Icons.search), Icon(Icons.more_vert)],
        centerTitle: true,
        title: Center(
          child: Text(
            '宝励首页',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: RefreshIndicator(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 175 / 262,
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 3,
          ),
          itemBuilder: (context, index) {
            return _getRow(context, index);
          },
          controller: _scrollController,
          itemCount: _list.length == 0
              ? 0
              : isLoading ? _list.length + 1 : _list.length,
        ),
        onRefresh: _onRefresh,
      ),
    );
  }

  _navIten(int i) {
    return  BottomNavigationBarItem(
      icon: Image.asset('assets/imagers/${_currentIndex==i?mIconDoctorsSelectIds[i]:mIconDoctorsIds[i]}.png',height: 24,),
      title: Text(titles[i]),
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget({
    Key key,
    @required this.defaultAppBarHeight,
  }) : super(key: key);

  final double defaultAppBarHeight;
  double getHeight(){
    if(mContext!=null){
     return mContext.size.height;
    }
    return 0;
  }
  BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Container(
      child: Container(
        child: Row(
          children: <Widget>[
            Image.asset(
              'assets/imagers/search.png',
              width: 14,
              height: 14,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "请输入你想要搜索的内容",
              style: TextStyle(color: Color(0xff8e8e93)),
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18.0)),
            color: Color(0xffffffff)),
        padding: EdgeInsets.all(8),
        width: MediaQuery
            .of(context)
            .size
            .width,
      ),
      margin: EdgeInsets.fromLTRB(
          0, MediaQueryData
          .fromWindow(window)
          .padding
          .top + defaultAppBarHeight, 0, 0),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("页面---")],
      ),
    );
  }
}
