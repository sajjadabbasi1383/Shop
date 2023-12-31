
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/view/product_info_screen.dart';
import '../controller/home_controller.dart';
import '../controller/product_info_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final HomeController homeController = Get.put(HomeController());
  final ProductInfoController productInfoController = Get.put(ProductInfoController());
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Search'),
          elevation: 0.0,
        ),
        body: homeController.loading.value == false
            ?Column(
          children:[
            Container(
              color: Colors.indigo,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    leading: const Icon(Icons.search),
                    title: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: onSearchTextChanged,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        onSearchTextChanged('');
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                  ? ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            productInfoController.id.value=int.parse(_searchResult[i].id.toString());
                            Get.to(const ProductInfoScreen());
                          },
                          child: Card(
                            margin: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _searchResult[i].image!,
                                ),
                              ),
                              title: Text(
                                  _searchResult[i].title!),
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: homeController.productList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            productInfoController.id.value=int.parse( homeController.productList[index].id.toString());
                            Get.to(const ProductInfoScreen());
                          },
                          child: Card(
                            margin: const EdgeInsets.all(0.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  homeController.productList[index].image!,
                                ),
                              ),
                              title: Text(
                                  homeController.productList[index].title!),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ):SizedBox(
          height: Get.height / 1.5,
          child: const SpinKitFadingCube(
            size: 45,
            color: Colors.indigo,
          ),
        )
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    homeController.productList.forEach((element) {
      if (element.title!.contains(text)) _searchResult.add(element);
    });

    setState(() {});
  }
}

List<ProductModel> _searchResult = [];
