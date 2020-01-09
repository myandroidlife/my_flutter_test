import 'package:flutter/material.dart';
class LoadingContainer extends StatelessWidget{
  final Widget chide;
  final bool isLoading;
  final bool cover;

  const LoadingContainer({Key key,@required this.chide, this.isLoading, this.cover = false}) : super(key: key);

  get _loading => Center(child: CircularProgressIndicator(),);
  @override
  Widget build(BuildContext context) {
    return !cover?!isLoading?chide:_loading:Stack(children: <Widget>[chide,isLoading?_loading:null],);
  }
}