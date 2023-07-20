import 'package:equatable/equatable.dart';
import 'package:nuntium/product/utility/base/base_firebase_model.dart';

class News extends Equatable with IdModel, BaseFirebaseModel<News> {
  const News({
    this.category,
    this.categoryId,
    this.title,
    this.backroundImage,
    this.id,
  });

  final String? category;
  final String? categoryId;
  final String? title;
  final String? backroundImage;
  @override
  final String? id;

  @override
  List<Object?> get props => [category, categoryId, title, backroundImage, id];

  News copyWith({
    String? category,
    String? categoryId,
    String? title,
    String? backroundImage,
    String? id,
  }) {
    return News(
      category: category ?? this.category,
      categoryId: categoryId ?? this.categoryId,
      title: title ?? this.title,
      backroundImage: backroundImage ?? this.backroundImage,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'categoryId': categoryId,
      'title': title,
      'backroundImage': backroundImage,
      'id': id,
    };
  }

  @override
  News fromJson(Map<String, dynamic> json) {
    return News(
      category: json['category'] as String?,
      categoryId: json['categoryId'] as String?,
      title: json['title'] as String?,
      backroundImage: json['backroundImage'] as String?,
      id: json['id'] as String?,
    );
  }
}
