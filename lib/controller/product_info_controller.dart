import 'package:get/get.dart';
import 'package:shop/models/product_model.dart';

import '../services/dio_service.dart';


class ProductInfoController extends GetxController{
  RxBool loading=false.obs;
  RxInt id=RxInt(0);
  Rx<ProductModel> productInfoModel=ProductModel().obs;

  getProductInfo() async {
    productInfoModel=ProductModel().obs;
    loading.value=true;
    var response = await DioService().getMethod('https://dummyjson.com/products/$id');
    if (response.statusCode == 200) {
      productInfoModel.value=ProductModel.fromJson(response.data);
      loading.value=false;
    }
  }

}