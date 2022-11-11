// To parse this JSON data, do
//
//     final topicDetailsModel = topicDetailsModelFromJson(jsonString);

import 'dart:convert';

TopicDetailsModel topicDetailsModelFromJson(String str) => TopicDetailsModel.fromJson(json.decode(str));

String topicDetailsModelToJson(TopicDetailsModel data) => json.encode(data.toJson());

class TopicDetailsModel {
    TopicDetailsModel({
        this.response,
        this.error,
        this.resultArray,
    });

    String? response;
    bool? error;
    List<ResultArray>? resultArray;

    factory TopicDetailsModel.fromJson(Map<String, dynamic> json) => TopicDetailsModel(
        response: json["response"],
        error: json["error"],
        resultArray: List<ResultArray>.from(json["result_array"].map((x) => ResultArray.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "response": response,
        "error": error,
        "result_array": List<dynamic>.from(resultArray!.map((x) => x.toJson())),
    };
}

class ResultArray {
    ResultArray({
        this.topicId,
        this.title,
        this.titleImage,
        this.shortDesc,
        this.shortArabDesc,
        this.description,
        this.descriptionAr,
        this.imageArray,
        this.videoLink,
        this.audioLink,
        this.createdon,
    });

    String? topicId;
    String? title;
    String? titleImage;
    String? shortDesc;
    String? shortArabDesc;
    String? description;
    String? descriptionAr;
    List<ImageArray>? imageArray;
    String? videoLink;
    String? audioLink;
    DateTime? createdon;

    factory ResultArray.fromJson(Map<String, dynamic> json) => ResultArray(
        topicId: json["topic_id"],
        title: json["title"],
        titleImage: json["title_image"],
        shortDesc: json["short_desc"],
        shortArabDesc: json["short_arab_desc"],
        description: json["description"],
        descriptionAr: json["description_ar"],
        imageArray: List<ImageArray>.from(json["image_array"].map((x) => ImageArray.fromJson(x))),
        videoLink: json["video_link"],
        audioLink: json["audio_link"],
        createdon: DateTime.parse(json["createdon"]),
    );

    Map<String, dynamic> toJson() => {
        "topic_id": topicId,
        "title": title,
        "title_image": titleImage,
        "short_desc": shortDesc,
        "short_arab_desc": shortArabDesc,
        "description": description,
        "description_ar": descriptionAr,
        "image_array": List<dynamic>.from(imageArray!.map((x) => x.toJson())),
        "video_link": videoLink,
        "audio_link": audioLink,
        "createdon": createdon!.toIso8601String(),
    };
}

class ImageArray {
    ImageArray({
        this.topicId,
        this.imagePath,
    });

    String? topicId;
    String? imagePath;

    factory ImageArray.fromJson(Map<String, dynamic> json) => ImageArray(
        topicId: json["topic_id"],
        imagePath: json["image_path"],
    );

    Map<String, dynamic> toJson() => {
        "topic_id": topicId,
        "image_path": imagePath,
    };
}
