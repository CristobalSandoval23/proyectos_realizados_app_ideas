import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyectos_flutter/practica_rapidez_crud/model/data_model.dart';
import'package:http/http.dart' as http;
class PracticaService extends ChangeNotifier {
      final String _baseURL = "note-app-f0b07-default-rtdb.firebaseio.com";
      List<EjercicioModal> listaData = [];
      late EjercicioModal selectData;  

    PracticaService(){
      getsData();
    }

    createOrUpdate(EjercicioModal data){
      (data.id == "123") ? postData(data): putData(data);
    }

    getsData() async{
      notifyListeners();
      final Uri url = Uri.http(_baseURL, "/ejercicios.json") ;
      final resp = await http.get(url);
      final Map<String, dynamic> mapBody = json.decode(resp.body);

      mapBody.forEach((key, value) {
        final temp = EjercicioModal.fromMap(value);
        temp.id = key;
        listaData.add(temp);
      },);
      print(listaData);
      notifyListeners();
    }
    putData(EjercicioModal data)async{
          notifyListeners();
      final Uri url = Uri.https(_baseURL, "/ejercicios/${data.id}.json") ;
      final resp = await http.put(url, body: data.toJson());

      final int posicion = listaData.indexWhere((element) => element.id == data.id); 
      listaData[posicion] = data;
      print(resp);
      notifyListeners();
    }
    postData(EjercicioModal data)async {
                    notifyListeners();
      final Uri url = Uri.http(_baseURL, "/ejercicios.json") ;
      final resp = await http.post(url, body: data.toJson());
      listaData.add(data);
      print(resp);
      notifyListeners();
    }
    deleteData(EjercicioModal data )async {
                  notifyListeners();
      final Uri url = Uri.https(_baseURL, "/ejercicios/${data.id}.json") ;
      final resp = await http.delete(url);

      final int posicion = listaData.indexWhere((element) => element.id == data.id); 
      listaData.removeAt(posicion);
      print(resp);
      notifyListeners();
    }

}