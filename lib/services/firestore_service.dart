import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName;

  FirestoreService(this.collectionName);

  Future<void> createDocument(String id, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(id).set(data);
  }

  Future<DocumentSnapshot> getDocument(String id) async {
    return await _firestore.collection(collectionName).doc(id).get();
  }

  Future<void> updateDocument(String id, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(id).update(data);
  }

  Future<void> deleteDocument(String id) async {
    await _firestore.collection(collectionName).doc(id).delete();
  }
}
