import 'package:meta/meta.dart';
import 'dart:convert';

CategoryModal categoryModalFromJson(String str) => CategoryModal.fromJson(json.decode(str));

String categoryModalToJson(CategoryModal data) => json.encode(data.toJson());

class CategoryModal {
  final int categoryId;
  final String categoryName;
  final String categoryImage;

  CategoryModal({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  factory CategoryModal.fromJson(Map<String, dynamic> json) => CategoryModal(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
