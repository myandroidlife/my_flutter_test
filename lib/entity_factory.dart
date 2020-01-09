import 'package:flutter_app/entity/home_pager_entity.dart';
import 'package:flutter_app/entity/search_item_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HomePagerEntity") {
      return HomePagerEntity.fromJson(json) as T;
    } else if (T.toString() == "SearchItemEntity") {
      return SearchItemEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}