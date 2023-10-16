import 'package:exercicio_crud/pet.dart';
import 'package:exercicio_crud/petRepo.dart';
import 'package:flutter/material.dart';

class MyEdit extends StatefulWidget {
  Pet pet;
  int indice;
  MyEdit(this.pet, this.indice, {super.key});

  @override
  State<MyEdit> createState() => _MyEditState();
}

class _MyEditState extends State<MyEdit> {
  @override
  final campoNome = TextEditingController();
  final campoIdade = TextEditingController();
  final campoRaca = TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List list = PetRepo.get_listPet;
  Widget build(BuildContext context) {
    inicializa();
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar'),
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

                          Pet p = new Pet(nome, idade, raca);

                          list[widget.indice] = p;
                          print(widget.indice);
                          mostrarMsgSucesso();
                        }
                      },
                      icon: Icon(Icons.pest_control_rodent_rounded),
                      label: Text('Editar')),
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

  void inicializa() {
    campoNome.text = widget.pet.nome;
    campoRaca.text = widget.pet.raca;
    campoIdade.text = widget.pet.idade.toString();
  }

  void mostrarMsgSucesso() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Pet cadastrado com sucesso')));
  }
}
