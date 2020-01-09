import 'package:flutter/material.dart';
import 'package:flutter_app/entity/search_item_entity.dart';
import 'package:flutter_app/net/SearchDao.dart';

import 'WebView.dart';
import 'XieChengSearchPager.dart';

class XieChenSearchBarPager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MSate();
  }
}

class MSate extends State<XieChenSearchBarPager> {
  String showText = '获取';
  SearchItemEntity searchItemEntity = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(context),
          InkWell(
            child: Text(showText),
            onTap: () {
              SearchDao.feach("长城").then((SearchItemEntity value) {
                setState(() {
                  showText = value.data[0].url;
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, posituon) {
                  return _item(posituon);
                },
                itemCount: searchItemEntity?.data?.length ?? 0),
            flex: 1,
          )
        ],
      ),
    );
  }

  _appBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 15),
      child: XieChenSearchBar(
        hidLeft: false,
        defaultText: '网红打卡地 景点 酒店 美食',
        hint: '输入抖索内容',
        leftBtnClick: () {
          Navigator.pop(context);
        },
        onChanged: (text) {
          if (text.length > 0) {
            //searchItemEntity = null;
            SearchDao.feach(text).then((SearchItemEntity value) {
              setState(() {
                searchItemEntity = value;
                showText = value.data[0].url;
              });
            });
          }
        },
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }

  Widget _item(int posituon) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return  WebView(
            url: searchItemEntity.data[posituon].url,
            hidAppBar: false,
            title: '详情',
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(children: <Widget>[
          Column(children: <Widget>[
            Container(width: 300,child: Text('我就是搜索条目'),)
          ],)
        ],),
      ),
    );
  }
}
