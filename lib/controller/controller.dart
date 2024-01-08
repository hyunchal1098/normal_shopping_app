import 'package:get/get.dart';
import 'package:normal_shopping_app/data/services.dart';
import 'package:normal_shopping_app/model/product_model.dart';

class Controller extends GetxController {
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  /// http client와 데이터 가져옴
  /// Services에서 데이터 가져오는 함수 생성
  Future<void> fetchData() async {
    var products = await Services.fetchProducts();
    if (products != null) {
      productList.value = products;
    }
  }
}
