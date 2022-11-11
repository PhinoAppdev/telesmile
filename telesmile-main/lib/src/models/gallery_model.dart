// To parse this JSON data, do
//
//     final galleryModel = galleryModelFromJson(jsonString);

import 'dart:convert';

GalleryModel galleryModelFromJson(String str) => GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel {
    GalleryModel({
        this.response,
        this.error,
        this.message,
        this.category,
    });

    String? response;
    bool? error;
    String? message;
    List<Category>? category;

    factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
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
        this.galId,
        this.imagePath,
        this.prefNo,
    });

    String? galId;
    String? imagePath;
    String? prefNo;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        galId: json["gal_id"],
        imagePath: json["image_path"],
        prefNo: json["pref_no"],
    );

    Map<String, dynamic> toJson() => {
        "gal_id": galId,
        "image_path": imagePath,
        "pref_no": prefNo,
    };
}
