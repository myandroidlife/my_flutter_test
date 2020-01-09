import 'package:flutter/material.dart';

enum SearchBarType { home, normal, homeLight }

class XieChenSearchBar extends StatefulWidget {
  final bool enabled;
  final bool hidLeft;
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;
  final void Function() leftBtnClick;
  final void Function() rightBtnClick;

  final void Function() speakleftBtnClick;
  final void Function() inputBoxClick;
  final void Function(String text) onChanged;

  const XieChenSearchBar(
      {Key key,
      this.enabled = true,
      this.hidLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftBtnClick,
      this.rightBtnClick,
      this.speakleftBtnClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return XieChengSearchPagerStat();
  }
}

class XieChengSearchPagerStat extends State<XieChenSearchBar> {
  bool sgowClear = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    sgowClear = widget.defaultText!=null?true:false;
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  _genNormalSearch() {
    return Container(
      child: Row(
        children: <Widget>[
          _warpTab(
              Container(
                child: widget?.hidLeft ?? false
                    ? null
                    : Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                        size: 26,
                      ),
              ),
              widget.leftBtnClick),
          Expanded(
            child: _inputBox(),
            flex: 1,
          ),
          _warpTab(
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  "搜索",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
              widget.rightBtnClick)
        ],
      ),
    );
  }

  _inputBox() {
    Color inputBoxColor;
    inputBoxColor = widget.searchBarType == SearchBarType.home
        ? Colors.white
        : Color(0xffEDEDED);
    return  Container( padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.searchBarType == SearchBarType.normal?5:15),color: Color(0xffEDEDED)),child:Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9A9)
                : Colors.blue,
          ),
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
              controller: _controller,
              onChanged: _onChaged,
              autofocus: true,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  textBaseline: TextBaseline.alphabetic,
                  fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, -15, 5, 0),
                  border: InputBorder.none,
                  hintText: widget.hint ?? '',
                  hintStyle: TextStyle(fontSize: 15)),
            )
                : _warpTab(
                Container(
                  child: Text(
                    widget.defaultText,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                widget.inputBoxClick),

          ),!sgowClear?_warpTab(Icon(Icons.mic,size: 22,color:widget.searchBarType == SearchBarType.normal?Colors.blue:Colors.grey ,), widget.speakleftBtnClick)
              :_warpTab(Icon(Icons.clear,size: 22,color: Colors.grey,), (){
                setState(() {
                  _controller.clear();
                });
                _onChaged('');
          })
        ],
      ));

  }

  _genHomeSearch() {
    return Container(
      margin: EdgeInsets.only(top: 30,left: 15,right: 15),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(widget.searchBarType == SearchBarType.normal?5:15),color: Color(0xffEDEDED)),
      child: Row(children: <Widget>[
        _warpTab(Icon(Icons.search,size: 22,color:widget.searchBarType == SearchBarType.normal?Colors.blue:Colors.grey ,), widget.speakleftBtnClick),
        Expanded(child: Container(child: Text(widget.defaultText ,style: TextStyle(fontSize: 13, color: Colors.grey),),),),
        _warpTab(Icon(Icons.mic,size: 22,color:widget.searchBarType == SearchBarType.normal?Colors.blue:Colors.grey ,), widget.speakleftBtnClick)
      ],),
    );
  }

  _warpTab(Widget child, void Function() callback) {
    return GestureDetector(
      child: child,
      onTap: () {
        if (callback != null) {
          callback();
        }
      },
    );
  }

  _onChaged(String text) {
    if (text.length > 0) {
      setState(() {
        sgowClear = true;
      });
    } else {
      setState(() {
        sgowClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }
}
