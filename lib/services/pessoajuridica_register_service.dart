// pessoa_juridica_register_service.dart
import 'auth_service.dart';
import 'firestore_service.dart';

class PessoaJuridicaService {
  final AuthService _authService;
  final FirestoreService _firestoreService;

  PessoaJuridicaService() 
    : _firestoreService = FirestoreService('users'),
      _authService = AuthService();

  Future registerPessoaJuridica(
    String email, 
    String password, 
    String cnpj, 
    String nome, 
    String endereco, 
    String telefone,
    String razaoSocial
  ) async {
    var additionalData = {
      'type': 'pessoaJuridica',
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
      'cnpj': cnpj,
      'razaoSocial': razaoSocial,
    };

    var user = await _authService.register(email, password, additionalData);
    if (user != null) {
      await _firestoreService.createDocument(user.uid, additionalData);
    }
    return user;
  }
}
