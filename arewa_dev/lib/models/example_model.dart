class ExampleModel {
  final String title;
  final String code;
  final String? explanation;

  ExampleModel({
    required this.title,
    required this.code,
    this.explanation,
  });

  factory ExampleModel.fromJson(Map<String, dynamic> json) {
    return ExampleModel(
      title: json['title'],
      code: json['code'],
      explanation: json['explanation'],
    );
  }
}
