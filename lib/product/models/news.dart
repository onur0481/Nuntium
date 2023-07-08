import 'package:equatable/equatable.dart';

class News extends Equatable {
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      backgroundImage: json['backgroundImage'] as String?,
      id: json['id'] as String?,
    );
  }

  // ignore: sort_unnamed_constructors_first
  const News({
    this.category,
    this.categoryId,
    this.title,
    this.backgroundImage,
    this.id,
  });
  final String? category;
  final String? categoryId;
  final String? title;
  final String? backgroundImage;
  final String? id;

  @override
  List<Object?> get props => [category, categoryId, title, backgroundImage, id];

  News copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? backgroundImage,
    String? id,
  }) {
    return News(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'backgroundImage': backgroundImage,
      'id': id,
    };
  }
}
