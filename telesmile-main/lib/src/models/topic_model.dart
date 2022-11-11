// To parse this JSON data, do
//
//     final topicsModel = topicsModelFromJson(jsonString);

import 'dart:convert';

TopicsModel topicsModelFromJson(String str) => TopicsModel.fromJson(json.decode(str));

String topicsModelToJson(TopicsModel data) => json.encode(data.toJson());

class TopicsModel {
    TopicsModel({
        this.response,
        this.error,
        this.resultArray,
    });

    String? response;
    bool? error;
    List<ResultArray>? resultArray;

    factory TopicsModel.fromJson(Map<String, dynamic> json) => TopicsModel(
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
        this.catId,
        this.catTitle,
        this.catSubTitle,
        this.catArabicTitle,
        this.catDesc,
        this.catArabDesc,
        this.topic,
        this.createdon,
    });

    String? catId;
    String? catTitle;
    String? catSubTitle;
    String? catArabicTitle;
    String? catDesc;
    String? catArabDesc;
    List<Topic>? topic;
    DateTime? createdon;

    factory ResultArray.fromJson(Map<String, dynamic> json) => ResultArray(
        catId: json["cat_id"],
        catTitle: json["cat_title"],
        catSubTitle: json["cat_sub_title"],
        catArabicTitle: json["cat_arabic_title"],
        catDesc: json["cat_desc"],
        catArabDesc: json["cat_arab_desc"],
        topic: List<Topic>.from(json["topic"].map((x) => Topic.fromJson(x))),
        createdon: DateTime.parse(json["createdon"]),
    );

    Map<String, dynamic> toJson() => {
        "cat_id": catId,
        "cat_title": catTitle,
        "cat_sub_title": catSubTitle,
        "cat_arabic_title": catArabicTitle,
        "cat_desc": catDesc,
        "cat_arab_desc": catArabDesc,
        "topic": List<dynamic>.from(topic!.map((x) => x.toJson())),
        "createdon": createdon!.toIso8601String(),
    };
}

class Topic {
    Topic({
        this.topicId,
        this.title,
        this.titleImage,
        this.shortDesc,
        this.shortArabDesc,
        this.description,
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
    String? videoLink;
    String? audioLink;
    DateTime? createdon;

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        topicId: json["topic_id"],
        title: json["title"],
        titleImage: json["title_image"],
        shortDesc: json["short_desc"],
        shortArabDesc: json["short_arab_desc"],
        description: json["description"],
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
        "video_link": videoLink,
        "audio_link": audioLink,
        "createdon": createdon!.toIso8601String(),
    };
}
