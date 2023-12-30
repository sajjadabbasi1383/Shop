
class ProductModel{
  String? id;
  String? title;
  String? description;
  String? price;
  String? discountPercentage;
  String? rating;
  String? stock;
  String? brand;
  String? category;
  String? image;


  ProductModel({

    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.image,
  });

  ProductModel.fromJson(Map<String,dynamic> element){
    id=element["id"].toString()??'';
    title=element["title"]??'';
    description=element["description"];
    price=element["price"].toString()??'';
    discountPercentage=element["discountPercentage"].toString()??'';
    rating=element["rating"].toString();
    stock=element["stock"].toString()??'';
    brand=element["brand"]??'';
    category=element["category"]??'';
    image=element["images"][0];
  }

}
