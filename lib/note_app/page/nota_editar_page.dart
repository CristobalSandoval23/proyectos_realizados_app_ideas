import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/note_app/model/note_model.dart';
import 'package:proyectos_flutter/note_app/service/note_service.dart';

class NotaEditionPage extends StatelessWidget {
  const NotaEditionPage({super.key});

  @override
  Widget build(BuildContext context) {
                  final notasServices = Provider.of<NoteService>(context);
                 final nota = notasServices.notaSelect;
    return Scaffold(
      appBar: AppBar(
        title: (nota.id == "123") ?const Text("Crear nota") : const Text("Editar nota"),
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, "note_app");
          },
          child: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: ((value) => nota.descripcion = value),
                  initialValue: (nota.id == "123") ? "" :  nota.descripcion,
                    decoration: InputDecoration(labelText: (nota.id == "123") ? "Agregar descripción" :  "Editar descripción"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final NotasModal notaTemp = nota;
                  notasServices.crearOrActualizar(notaTemp);
                  Navigator.popAndPushNamed(context, "note_app");
                },
                child: Container(
                 decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular( 10))

                  ),
                  padding: const EdgeInsets.all(10),
                  child: (nota.id == "123") ?const Text("Agregar nota") : const Text("Editar nota"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}