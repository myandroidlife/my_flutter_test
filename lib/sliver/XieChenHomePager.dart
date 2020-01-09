import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/entity/home_pager_entity.dart';
import 'package:flutter_app/net/HomeDao.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'LoadingContainer.dart';
import 'GridNav.dart';
import 'LocalNav.dart';
import 'SalasBox.dart';
import 'SubNav.dart';
import 'SearchBar.dart';
import 'XieChengSearchPager.dart';
import 'XiechenSearchList.dart';
class XieChenHomePager extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return XieChenHomeStat();
  }
}

class XieChenHomeStat extends State<XieChenHomePager> {
  List<HomePagerBannerlist> imgs ;
  String resultString = "";
  HomePagerEntity entity;
  List<HomePagerLocalnavlist> localNavList=[];
  HomePagerGridnav gridNav;
  int _APP_BAR_SCOLL_OFFSET = 100;
  bool _isLoading = true;

  double alpha = 0;
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
//    HomeDao.feach().then((restlt){
//      setState(() {
//        resultString = json.encode(restlt);
//      });
//    }).catchError((e){
//      resultString = e.toString()
//    });
    HomePagerEntity entity1 = await HomeDao.feach();
    resultString = entity.toString();
    setState(() {
      this.entity = entity1;
      imgs = entity1.bannerList;
     this.gridNav= entity1.gridNav;
      localNavList = entity1.localNavList;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarBrightness: alpha==0?Brightness.dark:Brightness.light));

    return Scaffold(
      body: LoadingContainer(isLoading:_isLoading ,chide: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener(
                onNotification: (notification){//https://m.ctrip.com/restapi/h5api/searchapp/search?/source=mobileweb&actuon=autocomelete&contentType=json&keyword=%E9%95%BF%E5%9F%8E
                  if(notification is ScrollUpdateNotification&&notification.depth==0){
                      _onScroll(notification.metrics.pixels);
                  }
                },
                  child: ListView(
                children: <Widget>[
                  swiperImg() , //banner
                  Padding(padding: EdgeInsets.all(5),child: PhysicalModel(color: Colors.white,
                    child:  LocalNav(homePagerLocalnavlist: localNavList,),borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,elevation: 5,),),//导航菜单
                  GridNav(gridnav: gridNav,),//三列网格导航
                  Padding(padding: EdgeInsets.all(5),child: SubNav(list: entity.subNavList,),),//网格菜单
                  Container(height: 500,color: Colors.grey,),
                ],
              )),),
        Opacity(opacity:alpha,child: Container(
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(color: Colors.white),
          height: 70,
        ) ,)//导航栏
          ,GestureDetector(child: XieChenSearchBar(defaultText: "请输入搜索内容",searchBarType: SearchBarType.home,),onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return XieChenSearchBarPager();
            }));
          },)
        ],
      ),)
    );
  }

//////////////////////////////////////////////////////////小组件///////////////////////////////////////////////////////////
//Banner
  Container swiperImg() {
    return Container(
      child: Swiper(
        autoplay:     imgs==null?false:true,
        autoplayDelay: 5000,
        pagination: SwiperPagination(),
        itemHeight: 150.0,
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            imgs==null?"": imgs[index].icon,
            fit: BoxFit.fill,
            height: 150.0,
          );
        },
        itemCount: imgs==null?0: imgs.length,
//                viewportFraction: 0.8,
//                scale: 0.9,
      ),
      height: 200,
    );
  }

  void _onScroll(double pixels) {
    double alpha = pixels/_APP_BAR_SCOLL_OFFSET;
    if(alpha<0){
      alpha=0;
    }else if(alpha>1){
      alpha = 1;

    }
    setState(() {
    this.alpha = alpha;
    });
    print(pixels);
    print(alpha);
  }
}
