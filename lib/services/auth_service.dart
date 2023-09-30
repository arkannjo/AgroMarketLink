// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'firestore_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService('users');

  AuthService();

  Future<User?> register(String email, String password, Map<String, dynamic> additionalData) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        // Usando FirestoreService para criar um documento
        await _firestoreService.createDocument(result.user!.uid, additionalData);
      }
      
      return result.user;

    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      return null;
    }
    
  }
  
  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }
  
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      throw Exception('Erro ao tentar fazer login: ${error.toString()}');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
