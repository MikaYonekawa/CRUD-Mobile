import 'package:exercicio_crud/editar.dart';
import 'package:exercicio_crud/pet.dart';
import 'package:exercicio_crud/petRepo.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Pet> list = PetRepo.get_listPet;
  String busca = "";
  late List<Pet> listBusca;
  @override
  void atualizaLista(String nome) {
    listBusca = List.from(list);
    setState(() {
      listBusca = list
          .where((element) =>
              (element.nome.toLowerCase().contains(nome.toLowerCase())))
          .toList();
    }); //fazer validação
  }

  @override
  void initState() {
    // TODO: implement initState
    listBusca = List.from(list);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cadastro'),
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ClipOval(
            child: Container(
              width: 200,
              height: 200,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/1566/1566779.png',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 300,
            child: TextField(
              onChanged: (value) {
                busca = value;
                atualizaLista(value);
              },
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(255, 184, 206, 225),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.pest_control_rodent_outlined),
                  ),
                  title: Text(listBusca[index].nome),
                  subtitle: Text(listBusca[index].raca),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyEdit(listBusca[index], index);
                              },
                            ),
                          ).then((_) => setState(() {}));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            PetRepo.remover(list[index]);
                            atualizaLista(busca);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(
                    thickness: 2,
                  ),
              itemCount: listBusca.length),
        ],
      ),
    );
  }
}
