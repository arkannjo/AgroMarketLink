import 'auth_service.dart';
import 'firestore_service.dart';

class ProdutorRegisterService {
  final AuthService _authService;
  final FirestoreService _firestoreService;

  ProdutorRegisterService() 
    : _firestoreService = FirestoreService('users'),
      _authService = AuthService();

  Future registerProdutor(
    String email, 
    String password, 
    String cpf, 
    String nome, 
    String endereco, 
    String telefone, 
    String metodoCultivo
  ) async {   
    var additionalData = {
      'type': 'produtor',
      'nome': nome,
      'endereco': endereco,
      'telefone': telefone,
      'metodoCultivo': metodoCultivo == 'organico' ? 'organico' : 'convencional',
    };

    var user = await _authService.register(email, password, additionalData);
    if (user != null) {
      await _firestoreService.createDocument(user.uid, additionalData);
    }
    return user;
  }
}
