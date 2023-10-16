import 'package:exercicio_crud/pet.dart';
import 'package:exercicio_crud/petRepo.dart';
import 'package:flutter/material.dart';

class MyCadastro extends StatefulWidget {
  const MyCadastro({super.key});

  @override
  State<MyCadastro> createState() => _MyCadastroState();
}

class _MyCadastroState extends State<MyCadastro> {
  final campoNome = TextEditingController();
  final campoRaca = TextEditingController();
  final campoIdade = TextEditingController();

  final FocusNode focoNome = FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
              key: this._formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: campoNome,
                    keyboardType: TextInputType.text,
                    focusNode: focoNome,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 54, 54, 54)), //
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: campoIdade,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Idade',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 54, 54, 54)), //
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: campoRaca,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Raça',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 54, 54, 54)), //
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          String nome = campoNome.text;
                          String raca = campoRaca.text;
                          int idade = int.parse(campoIdade.text);
                          Pet p = Pet(nome, idade, raca);
                          PetRepo.add(p);
                          PetRepo.imprimir();
                          _formKey.currentState!.reset();
                          mostrarMsgSucesso();
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.pest_control_rodent_rounded),
                      label: Text('Cadastrar')),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamed(context, '/'),
                      icon: Icon(Icons.arrow_back),
                      label: Text('Voltar')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Pet cadastrado com sucesso')));
  }
}
