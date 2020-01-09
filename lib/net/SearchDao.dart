import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/entity/home_pager_entity.dart';
import 'package:flutter_app/entity/search_item_entity.dart';
import 'package:http/http.dart'as http;
const HOME_URL='https://m.ctrip.com/restapi/h5api/searchapp/search?/source=mobileweb&actuon=autocomelete&contentType=json&keyword=';
class SearchDao{
  static Future<SearchItemEntity> feach(String key)async{
    final response = await http.get(HOME_URL+key);
    if(response.statusCode==200){
      Utf8Codec utf8codec = Utf8Codec();//处理中文乱码
      var result = json.decode(utf8codec.decode(response.bodyBytes));
      print(response.body);
      return SearchItemEntity.fromJson(result);
    }else{
      throw Exception("首页数据加载失败...");
    }
  }
}