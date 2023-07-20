// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:nuntium/product/utility/base/base_firebase_model.dart';

@immutable
class Recommended with EquatableMixin, IdModel, BaseFirebaseModel<Recommended> {
  const Recommended({this.title, this.description, this.image, this.id});
  final String? title;
  final String? description;
  final String? image;
  @override
  final String? id;

  @override
  List<Object?> get props => [title, description, image, id];

  Recommended copyWith({
    String? title,
    String? description,
    String? image,
    String? id,
  }) {
    return Recommended(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
    };
  }

  @override
  Recommended fromJson(Map<String, dynamic> json) {
    return Recommended(
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
    );
  }
}
