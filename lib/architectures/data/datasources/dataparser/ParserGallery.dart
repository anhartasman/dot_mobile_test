import 'package:dot_mobile_test/architectures/domain/entities/Gallery.dart';
import 'package:dot_mobile_test/helpers/parser/parser_key.dart';

class ParserGallery {
  static Map<String, dynamic> defaultMap() {
    return {
      'caption': "",
      'thumbnail': "",
      'image': "",
    };
  }

  static Map<String, dynamic> mapToMap(Map<String, dynamic> theMap) {
    var defMap = defaultMap();

    defMap["caption"] = ParserKey.getString(theMap, "caption");
    defMap["thumbnail"] = ParserKey.getString(theMap, "thumbnail");
    defMap["image"] = ParserKey.getString(theMap, "image");

    return defMap;
  }

  static Gallery fromAPIResult(Map<String, dynamic> theMap) {
    var defMap = mapToMap(theMap);
    return Gallery.fromMap(defMap);
  }
}
