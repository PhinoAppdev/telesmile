// To parse this JSON data, do
//
//     final getCategoryModel = getCategoryModelFromJson(jsonString);

import 'dart:convert';

GetCategoryModel getCategoryModelFromJson(String str) => GetCategoryModel.fromJson(json.decode(str));

String getCategoryModelToJson(GetCategoryModel data) => json.encode(data.toJson());

class GetCategoryModel {
    GetCategoryModel({
        this.response,
        this.error,
        this.message,
        this.category,
    });

    String? response;
    bool? error;
    String? message;
    List<Category>? category;

    factory GetCategoryModel.fromJson(Map<String, dynamic> json) => GetCategoryModel(
        response: json["response"],
        error: json["error"],
        message: json["message"],
        category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "error": error,
        "message": message,
        "category": List<dynamic>.from(category!.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.catId,
        this.catTitle,
        this.catSubTitle,
        this.catArabicTitle,
        this.catDesc,
        this.catArabDesc,
        this.catImg,
        this.createdon,
    });

    String? catId;
    String? catTitle;
    String? catSubTitle;
    String? catArabicTitle;
    String? catDesc;
    String? catArabDesc;
    String? catImg;
    dynamic createdon;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["cat_id"],
        catTitle: json["cat_title"],
        catSubTitle: json["cat_sub_title"],
        catArabicTitle: json["cat_arabic_title"],
        catDesc: json["cat_desc"],
        catArabDesc: json["cat_arab_desc"],
        catImg: json["cat_img"],
        createdon: json["createdon"],
    );

    Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_title": catTitle,
        "cat_sub_title": catSubTitle,
        "cat_arabic_title": catArabicTitle,
        "cat_desc": catDesc,
        "cat_arab_desc": catArabDesc,
        "cat_img": catImg,
        "createdon": createdon,
    };
}
