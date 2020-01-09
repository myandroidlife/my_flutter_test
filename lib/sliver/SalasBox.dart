import 'package:flutter/material.dart';
import 'package:flutter_app/entity/home_pager_entity.dart';

class SalasBox extends StatelessWidget {
  final HomePagerSalesbox salesBox;

  const SalasBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _items(context),
      padding: EdgeInsets.all(7),
    );
  }

  _items(BuildContext context) {
    if(salesBox==null) return null;
    List<Widget> items = [];
    items.add(_doubleItems(context,salesBox));

  }

  Widget _doubleItems(BuildContext context, HomePagerSalesbox salesBox) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
      _doubleItem(context,salesBox.bigCard1),
    ],);
  }

  _doubleItem(BuildContext context, HomePagerSalesboxBigcard1 bigCard1) {

  }
}
