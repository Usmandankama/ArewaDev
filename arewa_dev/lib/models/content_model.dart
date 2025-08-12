import 'package:arewa_dev/models/example_model.dart';

class ContentModel {
  final int id;
  final String title;
  final String content;
  final ExampleModel example;

  ContentModel({
    required this.id,
    required this.title,
    required this.content,
    required this.example,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      example: ExampleModel.fromJson(json['example']),
    );
  }
}
