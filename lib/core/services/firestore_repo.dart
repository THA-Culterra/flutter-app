import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirestoreRepository {
  final FirebaseFirestore firestore;

  FirestoreRepository({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  Future<DocumentSnapshot<Map<String, dynamic>>> getDocument(
      String collection, String id) async {
    return await firestore.collection(collection).doc(id).get();
  }

  Future<void> setDocument(
      String collection, String id, Map<String, dynamic> data) async {
    await firestore.collection(collection).doc(id).set(data);
  }

  Future<void> updateDocument(
      String collection, String id, Map<String, dynamic> data) async {
    await firestore.collection(collection).doc(id).update(data);
  }

  Future<void> deleteDocument(String collection, String id) async {
    await firestore.collection(collection).doc(id).delete();
  }
}