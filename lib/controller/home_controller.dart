import 'package:get/get.dart';

import '../models/product_model.dart';
import '../services/dio_service.dart';

class HomeController extends GetxController{
  RxList<ProductModel> productList=RxList();
  RxBool loading=false.obs;

  @override
  onInit(){
    super.onInit();
    getProductList();
  }

  getProductList() async {
    productList.clear();
    loading.value=true;
    var response = await DioService().getMethod("https://dummyjson.com/products?limit=100");
    if (response.statusCode == 200) {
      response.data['products'].forEach((element) {
        productList.add(ProductModel.fromJson(element));
      });
      loading.value=false;
    }
  }
}