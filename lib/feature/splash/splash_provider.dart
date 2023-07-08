// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuntium/product/enums/platforms_enum.dart';
import 'package:nuntium/product/models/version_number_model.dart';
import 'package:nuntium/product/utility/firebase/firebase_collections.dart';
import 'package:nuntium/product/utility/version_manager.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    final checkIsNeedForceUpdate = VersionManager(
      deviceValue: clientVersion,
      databaseValue: databaseValue,
    );

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRedirectHome: false);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  Future<String?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;

    final response = await FirebaseCollections.version.reference
        .withConverter<VersionNumberModel>(
          fromFirestore: (snapshot, options) =>
              VersionNumberModel().fromFirebase(snapshot),
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();
    return response.data()?.number;
  }
}

class SplashState extends Equatable {
  const SplashState({this.isRequiredForceUpdate, this.isRedirectHome});
  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  // TODO: implement props
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate:
          isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
