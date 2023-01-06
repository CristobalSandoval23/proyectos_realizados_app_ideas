import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/note_app/model/note_model.dart';
import 'package:proyectos_flutter/note_app/service/note_service.dart';

class NoteAppPage extends StatelessWidget {
  const NoteAppPage({super.key});

  @override
  Widget build(BuildContext context) {

    final notaService = Provider.of<NoteService>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: notaService.notasList.length,
        itemBuilder: 
      (context, index) {
                  final NotasModal nota = notaService.notasList[index];
        return GestureDetector(
                onTap: () {
                 notaService.notaSelect = NotasModal(descripcion: nota.descripcion,id: nota.id);
                 Navigator.popAndPushNamed(context, "nota_editar");
                  
                },
                child: Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) async{
                    if(direction == DismissDirection.endToStart){
                       await notaService.deleteNote(nota);
                    }
                  },
                  child: Card(
                        color: Colors.amber,
                        elevation: 10,
                        child: Text(
                              notaService.notasList[index].descripcion,
                              textAlign: TextAlign.center)
                        ),
                ),
              );
      }
              
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
           notaService.notaSelect = NotasModal(descripcion: "",id: "123");
        Navigator.popAndPushNamed(context, "nota_editar" );
      },),
    );
  }
}