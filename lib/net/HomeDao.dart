import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/entity/home_pager_entity.dart';
import 'package:http/http.dart'as http;
const HOME_URL='https://www.devio.org/io/flutter_app/json/home_page.json';
class HomeDao{
  static Future<HomePagerEntity> feach()async{
    final response = await http.get(HOME_URL);
    if(response.statusCode==200){
      Utf8Codec utf8codec = Utf8Codec();//处理中文乱码
      var result = json.decode(utf8codec.decode(response.bodyBytes));
      print(response.body);
      return HomePagerEntity.fromJson(result);
    }else{
      throw Exception("首页数据加载失败...");
    }
  }
}