import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:normal_shopping_app/controller/controller.dart';
import 'package:normal_shopping_app/view/product_tile.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.view_list_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        child: Obx(
          () => GridView.builder(
            /// gridDelegate : gridview를 어떤 모양으로 만들건지
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              /// 2줄
              crossAxisCount: 2,

              /// 간격 10 없으면 붙어져서 나오기 때문에 하나만 있는 걸로 보임
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return ProductTile(
                controller.productList[index],
              );
            },
            itemCount: controller.productList.length,
          ),
        ),
      ),
    );
  }
}
