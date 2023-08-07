import 'package:dart_jsonpath/dart_json_path.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('adds one to input values', () {
    String json = """
      {
        "name":"test",
        "age": 20,
        "address": {
          "city": "test",
          "state": "test"
        },
        
        "phoneNumbers": [
          {
            "type": "home",
            "number": "212 555-1234"
          },
          {
            "type": "office",
            "number": "646 555-4567"
          }
        ]
      }
    """;


    JsonPath jsonPath = JsonPath.getInstance();
    assert( jsonPath.read(json, r"$.age") == 20);
    assert( jsonPath.read(json, r"$.name") == "test");
    assert( jsonPath.read(json, r"$.address.city") == "test");
    assert( jsonPath.read(json, r"$.phoneNumbers[0].type") == "home");
  });
}
