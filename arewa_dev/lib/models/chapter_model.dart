import 'package:arewa_dev/models/example_model.dart';

class ChapterModel {
  final int id;
  final String? title;
  final String? content;
  final String? code;
  final ExampleModel example;

  // final String displayTitle;

  ChapterModel({
    required this.id,
    required this.title,
    required this.content,
    required this.code,
    required this.example,
    // required this.displayTitle,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      code: json['code'],
      example: ExampleModel.fromJson(json['example']),
      // displayTitle: json['displayTitle'],
    );
  }
}
