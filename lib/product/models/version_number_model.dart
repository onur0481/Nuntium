import 'package:equatable/equatable.dart';
import 'package:nuntium/product/utility/base/base_firebase_model.dart';

// ignore: must_be_immutable
class VersionNumberModel extends Equatable
    with IdModel, BaseFirebaseModel<VersionNumberModel> {
  VersionNumberModel({
    this.number,
  });

  factory VersionNumberModel.fromJson(Map<String, dynamic> json) {
    return VersionNumberModel(
      number: json['number'] as String?,
    );
  }
  final String? number;

  @override
  String id = '';

  VersionNumberModel copyWith({
    String? number,
  }) {
    return VersionNumberModel(
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  String toString() => 'VersionNumberModel(number: $number)';

  @override
  VersionNumberModel fromJson(Map<String, dynamic> json) {
    return VersionNumberModel(
      number: json['number'] as String?,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
