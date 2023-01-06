import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/practica_rapidez_crud/model/data_model.dart';
import 'package:proyectos_flutter/practica_rapidez_crud/service/practica_service.dart';

class PracticaCRUDPage extends StatelessWidget {
  const PracticaCRUDPage({super.key});

  @override
  Widget build(BuildContext context) {
    final practicaService = Provider.of<PracticaService>(context);
    final List<EjercicioModal> listaData = practicaService.listaData;
    return Scaffold(
      appBar: AppBar(title: const Text("Practica"),),
      body: GridView.builder(
        itemCount: listaData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
          crossAxisSpacing: 1,
          childAspectRatio: 1
          ), itemBuilder:(context, index) {
           return GestureDetector(
            onTap: () {
              practicaService.selectData = listaData[index];
              mostrar(context, practicaService);
            },
             child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                if(direction == DismissDirection.endToStart) practicaService.deleteData(listaData[index]);
                   
              },
               child: Card(child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text("Nombre:${listaData[index].nombre}"),
                  Text("Rutina: ${listaData[index].serie}x${listaData[index].repeticiones}"),
                  Text("Descanso: ${listaData[index].descanso} minutos"),
                  ],),
                  Image.network("https://random.imagecdn.app/50/50")
                ],),),
             ),
           );
          }, ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
                practicaService.selectData = EjercicioModal(
                  descanso: 1, 
                  nombre: "", 
                  repeticiones: 2, 
                  serie: 1,
                  id: "123");
            mostrar(context, practicaService);
          },),
    );
  }
  
   mostrar(BuildContext context, PracticaService practicaService) {
    return showDialog(
      context: context, 
      builder: (context) {
        return SimpleDialog(
          title: Text((practicaService.selectData.id == "123") ?"Crear":"Editar", textAlign: TextAlign.center,),
            children: [
              TextFormField(
                initialValue: (practicaService.selectData.id == "123") ?"": practicaService.selectData.nombre,
                onChanged: (value) => practicaService.selectData.nombre = value,
                decoration:const InputDecoration(
                  label: Text("Nombre")
                ),
              ),
              TextFormField(
                initialValue: (practicaService.selectData.id == "123") ?"": practicaService.selectData.serie.toString(),
                onChanged: (value) => practicaService.selectData.serie = int.parse(value),
                decoration:const InputDecoration(
                  label: Text("Serie")
                ),
              ),
              TextFormField(
                initialValue: (practicaService.selectData.id == "123") ?"": practicaService.selectData.repeticiones.toString(),
                onChanged: (value) => practicaService.selectData.repeticiones = int.parse(value),
                decoration:const InputDecoration(
                  label: Text("Repeticiones")
                ),
              ),
              TextFormField(
                initialValue: (practicaService.selectData.id == "123") ?"": practicaService.selectData.descanso.toString(),
                onChanged: (value) => practicaService.selectData.descanso = int.parse(value),
                decoration:const InputDecoration(
                  label: Text("Descanso")
                ),
              ),
              GestureDetector(
                onTap:() {
                  practicaService.createOrUpdate(practicaService.selectData);
                },
                child: Card(child: Text((practicaService.selectData.id == "123") ?"Crear":"Editar", textAlign: TextAlign.center,),))
            ],
        );
      });
   }
}