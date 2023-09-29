// pessoa_fisica_register_service.dart
import 'auth_service.dart';
import 'firestore_service.dart';

class PessoaFisicaService {
  final AuthService _authService;
  final FirestoreService _firestoreService;

  PessoaFisicaService() 
    : _firestoreService = FirestoreService('users'),
      _authService = AuthService();

  Future registerPessoaFisica(
    String email, 
    String password, 
    String cpf, 
    String nome, 
    String endereco, 
    String telefone
  ) async {
    var additionalData = {
      'type': 'pessoaFisica',
      'cpf': cpf,
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
    };

    var user = await _authService.register(email, password, additionalData);
    if (user != null) {
      await _firestoreService.createDocument(user.uid, additionalData);
    }
    return user;
  }
}
