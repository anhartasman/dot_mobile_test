import 'package:dot_mobile_test/architectures/domain/entities/Place.dart';
import 'package:dot_mobile_test/helpers/parser/parser_key.dart';

class ParserPlace {
  static Map<String, dynamic> defaultMap() {
    return {
      'id': "",
      'title': "",
      'content': "",
      'type': "",
      'image': "",
      'media': [],
    };
  }

  static Map<String, dynamic> mapToMap(Map<String, dynamic> theMap) {
    var defMap = defaultMap();

    defMap["id"] = ParserKey.getString(theMap, "id");
    defMap["title"] = ParserKey.getString(theMap, "title");
    defMap["content"] = ParserKey.getString(theMap, "content");
    defMap["type"] = ParserKey.getString(theMap, "type");
    defMap["image"] = ParserKey.getString(theMap, "image");
    defMap["batal"] = ParserKey.getInt(theMap, "batal");
    defMap["media"] = theMap["media"];
    return defMap;
  }

  static Place fromAPIResult(Map<String, dynamic> theMap) {
    var defMap = mapToMap(theMap);
    return Place.fromMap(defMap);
  }
}
