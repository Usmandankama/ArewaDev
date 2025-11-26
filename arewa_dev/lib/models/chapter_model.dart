
class ChapterModel {
  final int id;
  final String title;
  final bool unlocked;
  final List<PageModel> content;

  ChapterModel({
    required this.id,
    required this.title,
    required this.unlocked,
    required this.content,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      title: json['title'],
      unlocked: json['unlocked'] ?? false,
      content: (json['content'] as List)
          .map((e) => PageModel.fromJson(e))
          .toList(),
    );
  }
}


class PageModel {
  final int page;
  final String title;
  final List<ContentBlock> content;

  PageModel({
    required this.page,
    required this.title,
    required this.content,
  });

  factory PageModel.fromJson(Map<String, dynamic> json) {
    return PageModel(
      page: json['page'],
      title: json['title'],
      content: (json['content'] as List)
          .map((e) => ContentBlock.fromJson(e))
          .toList(),
    );
  }
}

class ContentBlock {
  final String type; // "text" or "snippet"
  final String? title;
  final String value;

  ContentBlock({
    required this.type,
    this.title,
    required this.value,
  });

factory ContentBlock.fromJson(Map<String, dynamic> json) {
  return ContentBlock(
    type: json['type'] ?? "",
    title: json['title'],
    value: json['value']?.toString() ?? "",
  );
}

}



