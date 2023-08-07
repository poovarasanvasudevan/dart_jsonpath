import 'package:dart_jsonpath/src/JsonPathImpl.dart';

abstract class JsonPath {
  read(String json, String path);

  write(String json, String path, dynamic nodeValue, {bool update});

  delete(String json, String path);

  static JsonPath getInstance() {
    return JsonPathImpl.getInstance();
  }
}
