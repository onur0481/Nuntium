import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  version,
  tag,
  recommended,
  news;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);
}
