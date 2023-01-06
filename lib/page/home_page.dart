import 'package:flutter/material.dart';
import 'package:proyectos_flutter/model/band_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<BandModal> lista = [
      BandModal(id: "1", votes: 4, name: "gato"),
      BandModal(id: "2", votes: 3, name: "perro"),
      BandModal(id: "3", votes: 2, name: "ave"),
      BandModal(id: "4", votes: 1, name: "lapiz"),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Banner")),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) => _band(lista[index])
         ,),
         floatingActionButton: FloatingActionButton(
          elevation: 1,
          onPressed: add,
         child: const Icon(Icons.add),),
    );

  }

   add() {
   showDialog(
    context: context,
    builder:(context) {
      return AlertDialog();
    });
  }

   Widget _band(BandModal lista) {
   return ListTile(leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(lista.name.substring(0,2)),
            ),
            title: Text(lista.name),
            trailing: Text(lista.votes.toString()),
            );
   }
}