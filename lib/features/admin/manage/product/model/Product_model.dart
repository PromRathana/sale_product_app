// import 'Category.dart';

import 'package:sale_product_app/features/admin/manage/category/model/Category_model.dart';

class ProductModel {
  ProductModel({
      this.id, 
      this.name, 
      this.productCode, 
      this.category, 
      this.price, 
      this.cost, 
      this.stockQuantity, 
      this.description,});

  ProductModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    productCode = json['productCode'];
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    price = json['price'];
    cost = json['cost'];
    stockQuantity = json['stockQuantity'];
    description = json['description'];
  }
  int? id;
  String? name;
  String? productCode;
  CategoryModel? category;
  double? price;
  double? cost;
  double? stockQuantity;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['productCode'] = productCode;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['price'] = price;
    map['cost'] = cost;
    map['stockQuantity'] = stockQuantity;
    map['description'] = description;
    return map;
  }

}