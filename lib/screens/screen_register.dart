import 'package:flutter/material.dart';
import '/services/produtor_register_service.dart';
import '/services/pessoajuridica_register_service.dart';
import '/services/pessoafisica_register_service.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/custom_button.dart';
import '/widgets/responsive_layout.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String userType = 'Produtor';
  String email = '';
  String password = '';
  String cpfOrCnpj = '';
  String nome = '';
  String endereco = '';
  String telefone = '';
  String metodoCultivo = 'organico';
  String razaoSocial = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ResponsiveLayout(
                mobile: _buildMobileLayout(),
                tablet: _buildTabletLayout(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return ListView(
      children: _buildFormContent(),
    );
  }

  Widget _buildTabletLayout() {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: ListView(
          children: _buildFormContent(),
        ),
      ),
    );
  }

  List<Widget> _buildFormContent() {
    return [
      DropdownButton<String>(
        value: userType,
        onChanged: (String? newValue) {
          setState(() {
            userType = newValue!;
          });
        },
        items: <String>['Produtor', 'PessoaFisica', 'PessoaJuridica']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
      CustomTextField(
        onChanged: (value) => email = value,
        hint: 'Email',
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || !value.contains('@')) {
            return 'Por favor, insira um email válido.';
          }
          return null;
        },
      ),
      CustomTextField(
        onChanged: (value) => password = value,
        hint: 'Senha',
        isPassword: true,
        validator: (value) {
          if (value == null || value.length < 6) {
            return 'A senha deve ter pelo menos 6 caracteres.';
          }
          return null;
        },
      ),
      if (userType == 'PessoaJuridica')
        CustomTextField(
          onChanged: (value) => razaoSocial = value,
          hint: 'Razão Social',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira uma razão social.';
            }
            return null;
          },
        ),
      CustomTextField(
        onChanged: (value) => cpfOrCnpj = value,
        hint: userType == 'PessoaFisica' ? 'CPF' : 'CNPJ',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um ${userType == 'PessoaFisica' ? 'CPF' : 'CNPJ'}.';
          }
          // Aqui você pode adicionar mais validações para CPF e CNPJ.
          return null;
        },
      ),
      CustomTextField(
        onChanged: (value) => nome = value,
        hint: 'Nome',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um nome.';
          }
          return null;
        },
      ),
      CustomTextField(
        onChanged: (value) => endereco = value,
        hint: 'Endereço',
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um endereço.';
          }
          return null;
        },
      ),
      CustomTextField(
        onChanged: (value) => telefone = value,
        hint: 'Telefone',
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, insira um número de telefone.';
          }
          return null;
        },
      ),
      if (userType == 'Produtor')
        DropdownButton<String>(
          value: metodoCultivo,
          onChanged: (String? newValue) {
            setState(() {
              metodoCultivo = newValue!;
            });
          },
          items: <String>['organico', 'convencional']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      SizedBox(height: 20), // Espaçamento antes do botão
      CustomButton(
        text: isLoading ? 'Carregando...' : 'Registrar',
        onPressed: isLoading ? null : _register,
      ),
    ];
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      bool success = false;
      switch (userType) {
        case 'Produtor':
          success = await ProdutorRegisterService().registerProdutor(
              email, password, cpfOrCnpj, nome, endereco, telefone, metodoCultivo);
          break;
        case 'PessoaFisica':
          success = await PessoaFisicaService().registerPessoaFisica(
              email, password, cpfOrCnpj, nome, endereco, telefone);
          break;
        case 'PessoaJuridica':
          success = await PessoaJuridicaService().registerPessoaJuridica(
              email, password, cpfOrCnpj, nome, endereco, telefone, razaoSocial);
          break;
      }

      setState(() {
        isLoading = false;
      });

      if (success) {
        // Sucesso ao registrar. Pode navegar para outra tela, mostrar um snackbar, etc.
        Navigator.of(context).pop(); // por exemplo, voltar à tela anterior
      } else {
        // Erro ao registrar. Mostrar um alerta ou snackbar.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao registrar. Tente novamente.')),
        );
      }
    }
  }
}
