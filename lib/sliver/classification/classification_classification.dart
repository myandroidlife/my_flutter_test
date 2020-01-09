import 'package:flutter/material.dart';

class Classification extends StatefulWidget {
  @override
  ClassificationStat createState() => ClassificationStat();
}

class ClassificationStat extends State<Classification> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light ,
        title: Text('商品分类',style: TextStyle(fontSize: 20,color: Color(0xff333333)),),
        backgroundColor: Colors.white,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: _naveTetle(),
            width: 80,
          ),
          Expanded(
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Container(
                child: CustomScrollView(
                  slivers: _getAlldata(),
                ),
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }

  _naveTetle() {
    return ListView(
      children: _nav(),
    );
  }

  _nav() {
    List<Widget> items = [];
    for (int i = 0; i < 15; i++) {
      GlobalKey globalKey = GlobalKey();
      items.add(InkWell(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'DT食物',
                  style: TextStyle(
                      color: _selectIndex == i
                          ? Color(0xffcd1317)
                          : Color(0xff333333),
                      fontSize: 14,
                      fontWeight: _selectIndex == i? FontWeight.w600:FontWeight.normal),
                  key: globalKey,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: _selectIndex == i
                          ? Color(0xffcd1317)
                          : Color(0xff333333),
                      borderRadius: BorderRadius.circular(2)),
                  margin: EdgeInsets.only(
                    top: 2,
                  ),
                  height: _selectIndex == i ? 2 : 0,
                  width: 4 * 12.0,
                )
              ],
            ),
          ),
          height: 50,
          color: _selectIndex == i ? Colors.white : Color(0xfff6f6f6),
        ),
        onTap: () {
          setState(() {
            _selectIndex = i;
          });
        },
      ));
    }
    return items;
  }
_getAlldata(){
    List<Widget> list = [];
    list.addAll(_itemContent());
    list.addAll(_itemContent());
    list.addAll(_itemContent());
    return list;
}
  _itemContent() {
    List<Widget> items = [];
    SliverList list = SliverList(
        delegate: SliverChildListDelegate([
      Container(
        padding: EdgeInsets.only(top: 15, left: 15),
        child: Text('信息'),
      )
    ]));
    items.add(list);
    List<Widget> itemsChild = [];
    for (int i = 0; i < 8; i++) {
      itemsChild.add(Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(),
                child: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578476398260&di=9b287074d6628620e6de5dd84667b058&imgtype=jpg&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D1991501604%2C203186475%26fm%3D214%26gp%3D0.jpg',
                  height: 80,
                  width: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10,top: 5),
                child: Text(
                  '零食',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ));
    }
    items.add(SliverGrid.count(
      crossAxisCount: 3,
      children: itemsChild,
      childAspectRatio: 80 / 97,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
    ));
    return items;
  }
}
