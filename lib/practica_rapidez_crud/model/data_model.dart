// To parse this JSON data, do
//
//     final ejercicioModal = ejercicioModalFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class EjercicioModal {
    EjercicioModal({
        required this.descanso,
        required this.nombre,
        required this.repeticiones,
        required this.serie,
         this.id,
    });

    int descanso;
    String nombre;
    int repeticiones;
    int serie;
    String? id;
    factory EjercicioModal.fromJson(String str) => EjercicioModal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EjercicioModal.fromMap(Map<String, dynamic> json) => EjercicioModal(
        descanso: json["descanso"],
        nombre: json["nombre"],
        repeticiones: json["repeticiones"],
        serie: json["serie"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "descanso": descanso,
        "nombre": nombre,
        "repeticiones": repeticiones,
        "serie": serie,
        "id": id,
    };
}
