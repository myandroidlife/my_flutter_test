import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final String url;
  final String StatuBarColor;
  final String title;
  final bool hidAppBar;
  final bool backForbid;

  WebView(
      {this.url,
      this.StatuBarColor,
      this.title,
      this.hidAppBar,
      this.backForbid});

  @override
  State<StatefulWidget> createState() => _WebViewStat();
}

class _WebViewStat extends State<WebView> {
  final webViewRefrence = new FlutterWebviewPlugin();
  StreamSubscription<String> _urlChanger;

  StreamSubscription<WebViewStateChanged> _webViewState;

  StreamSubscription<WebViewHttpError> _onHttpError; //监听返回
  @override
  void initState() {
    if(widget.hidAppBar){
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
          .copyWith(statusBarBrightness: Brightness.dark));
    }
    webViewRefrence.close(); //防治页面重新打开
    _urlChanger = webViewRefrence.onUrlChanged.listen((String url) {
      //连接发送变化
    });
    _webViewState = webViewRefrence.onStateChanged.listen((webViewState) {
      //状态发送变化
      switch (webViewState.type) {
        case WebViewState.shouldStart:
          break;
        case WebViewState.startLoad:
          break;
        case WebViewState.finishLoad:
          break;
        case WebViewState.abortLoad:
          break;
      }
      _onHttpError = webViewRefrence.onHttpError.listen((error) {
        print(error.toString());
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _urlChanger.cancel();
    _webViewState.cancel();
    _onHttpError.cancel();
    webViewRefrence.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(0xffcd1317), Colors.white),
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
              color: Colors.white,
              child: Center(
                child: Text('waiting...'),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hidAppBar ?? false) {
      return Container(
        color: backButtonColor,
        height:MediaQuery.of(context).padding.top,
      );
    }
    return Container(
      //可以充屏幕宽度
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              child: Container(
                child: Icon(Icons.close),
                margin: EdgeInsets.only(left: 10),
              ),
            ),
            Positioned(
              //定位，支出位置
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backButtonColor, fontSize: 20),
                ),
              ),
              left: 0,
              right: 0,
            )
          ],
        ),
      ),
    );
  }
}
