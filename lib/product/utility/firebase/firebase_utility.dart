import 'package:nuntium/product/utility/base/base_firebase_model.dart';
import 'package:nuntium/product/utility/firebase/firebase_collections.dart';

mixin FirebaseUtility {
  Future<List<T>?> fetchList<T extends IdModel, R extends BaseFirebaseModel<T>>(
    R data,
    FirebaseCollections collections,
  ) async {
    final newsCollectionReference = collections.reference;

    final response = await newsCollectionReference.withConverter<T>(
      fromFirestore: (snapshot, options) {
        return data.fromFirebase(snapshot);
      },
      toFirestore: (value, options) {
        return {};
      },
    ).get();

    if (response.docs.isNotEmpty) {
      final value = response.docs.map((e) => e.data()).toList();
      return value;
    }
    return null;
  }
}
