import 'package:exercicio_crud/cadastro.dart';
import 'package:exercicio_crud/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crud Mika',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
      routes: {
        '/': (context) => MyHome(),
        '/cadastro': (context) => MyCadastro(),
      },
    );
  }
}
