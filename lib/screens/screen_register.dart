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
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ResponsiveLayout(
            mobile: _buildMobileLayout(),
            tablet: _buildTabletLayout(),
            // Adicione desktop ou outros layouts se você os definiu
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
      ),
      CustomTextField(
        onChanged: (value) => password = value,
        hint: 'Password',
        isPassword: true,
      ),
      if (userType == 'PessoaJuridica')
        CustomTextField(
          onChanged: (value) => razaoSocial = value,
          hint: 'Razão Social',
        ),
      CustomTextField(
        onChanged: (value) => cpfOrCnpj = value,
        hint: userType == 'PessoaFisica' ? 'CPF' : 'CNPJ',
      ),
      CustomTextField(
        onChanged: (value) => nome = value,
        hint: 'Nome',
      ),
      CustomTextField(
        onChanged: (value) => endereco = value,
        hint: 'Endereço',
      ),
      CustomTextField(
        onChanged: (value) => telefone = value,
        hint: 'Telefone',
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
      CustomButton(
        text: 'Register',
        onPressed: _register,
      ),
    ];
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      switch (userType) {
        case 'Produtor':
          ProdutorRegisterService().registerProdutor(email, password, cpfOrCnpj, nome, endereco, telefone, metodoCultivo);
          break;
        case 'PessoaFisica':
          PessoaFisicaService().registerPessoaFisica(email, password, cpfOrCnpj, nome, endereco, telefone);
          break;
        case 'PessoaJuridica':
          PessoaJuridicaService().registerPessoaJuridica(email, password, cpfOrCnpj, nome, endereco, telefone, razaoSocial);
          break;
      }
      // Adicione navegação ou tratamento de sucesso aqui...
    }
  }
}
