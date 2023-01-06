import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyectos_flutter/note_app/model/note_model.dart';

class NoteService extends ChangeNotifier{

  final String _urlBase = "note-app-f0b07-default-rtdb.firebaseio.com";
  late List<NotasModal> notasList = [];
  late NotasModal notaSelect;

  NoteService(){
    getNote();
  }

 crearOrActualizar(NotasModal nota){
  notifyListeners();
  (nota.id == "123") ? postNote(nota) : putNote(nota);
  notifyListeners();
 } 

 Future<List<NotasModal>> getNote() async{
    notifyListeners();
   Uri url = Uri.https(_urlBase, "/notas.json");
   final resp = await http.get(url);
   final Map<String, dynamic> mapResp = json.decode(resp.body);

  mapResp.forEach((key, value) {

    final temp = NotasModal.fromMap(value);
      temp.id = key;

    notasList.add(temp);
  });
    notifyListeners();
  return notasList;

  }
  postNote(NotasModal nota)async{
    notifyListeners();
   Uri url = Uri.https(_urlBase, "/notas.json");
   final resp = await http.post(url, body: nota.toJson(), headers: {
      "Content-Type":"application/json"
   });
   if(resp.statusCode != 200) return ; 
   final  bodyTemp = json.decode(resp.body);

        final temp = NotasModal.fromMap(nota.toMap());

        temp.id = bodyTemp["name"];

        notasList.add(temp);

    notifyListeners();

  }
  putNote(NotasModal nota)async{
    notifyListeners();

   Uri url = Uri.https(_urlBase, "/notas/${nota.id}.json");
   final resp = await http.put(url, body: nota.toJson(), headers: {
      "Content-Type":"application/json"
   });
   if(resp.statusCode != 200) return ; 
   final posicion = notasList.indexWhere((element) => element.id == nota.id);

   notasList[posicion] = nota;

    notifyListeners();

  }
  deleteNote(NotasModal nota)async{
    notifyListeners();

   Uri url = Uri.https(_urlBase, "/notas/${nota.id}.json");
   final resp = await http.delete(url, headers: {
      "Content-Type":"application/json"
   });
   if(resp.statusCode != 200) return ; 
   final posicion = notasList.indexWhere((element) => element.id == nota.id);

    notasList.removeAt(posicion);

    notifyListeners();

  }

}

