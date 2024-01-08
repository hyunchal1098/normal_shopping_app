import 'package:http/http.dart' as http;
import 'package:normal_shopping_app/model/product_model.dart';

class Services {
  /// static으로 하는 이유는 서버 연결하고 닫을 때마다 http 클라이언트를 생성하는건 비효율적
  static var client = http.Client();

  /// async 방식의 메서드 이므로 Future 타입의 데이터 리턴
  /// Future<List<>> 는 null을 가질수 없기때문에 nullsafety 적용?
  static Future<List<Product>?> fetchProducts() async {
    var response = await client.get(
      Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline",
      ),
    );

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productFromJson(jsonData);
    } else {
      return null;
    }
  }
}
