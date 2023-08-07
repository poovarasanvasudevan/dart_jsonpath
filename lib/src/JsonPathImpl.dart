import 'package:dart_jsonpath/src/JsonPath.dart';
import 'package:dart_jsonpath/src/JsonPathDeleter.dart';
import 'package:dart_jsonpath/src/JsonPathReader.dart';
import 'package:dart_jsonpath/src/JsonPathWriter.dart';

class JsonPathImpl implements JsonPath {
  static final JsonPathImpl _instance = new JsonPathImpl._internal();
  static bool update = false;
  static const TAG = "JsonPathImpl";

  JsonPathImpl._internal();

  static JsonPathImpl getInstance() {
    return _instance;
  }

  @override
  dynamic read(String json, String path) {
    return JsonPathReader.getInstance().read(json, path);
  }

  @override
  dynamic delete(String json, String path) {
    return JsonPathDeleter.getInstance().delete(json, path);
  }

  @override
  dynamic write(String json, String path, dynamic nodeValue, {bool? update}) {
    try {
      var data;
      if (nodeValue == null) {
        data = JsonPathDeleter.getInstance().delete(json, path);
      } else {
        data = JsonPathWriter.getInsatnce()
            .write(json, path, nodeValue, update: update);
      }
      if (data == null) {
        return json;
      }
      return data;
    } catch (e) {
      print("Error in writing data in json");
      return json;
    }
  }
}
