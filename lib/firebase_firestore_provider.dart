import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseFirestoreProvider = Provider(
  (ref) => FirebaseFirestoreProvider(
    firestore: FirebaseFirestore.instance,
  ),
);

class FirebaseFirestoreProvider {
  final FirebaseFirestore firestore;

  FirebaseFirestoreProvider({required this.firestore});
}
