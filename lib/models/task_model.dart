import 'dart:convert';

class Taskmodel {
    String title;
    String ?subtitle;
    bool isCompleted;
    String ?creatAt;

    Taskmodel({
        required this.title,
    required    this.subtitle,
         this.isCompleted=false,
        this.creatAt,
    });

    factory Taskmodel.fromRawJson(String str) => Taskmodel.fromJson(json.decode(str));
    String toRawJson() => json.encode(toJson());
    factory Taskmodel.fromJson(Map<String, dynamic> json) => Taskmodel(
        title: json["title"],
        subtitle: json["subtitle"],
        isCompleted: json["isCompleted"],
        creatAt: json["creatAt"],
    );
    Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isCompleted": isCompleted,
        "creatAt": creatAt,
    };
}