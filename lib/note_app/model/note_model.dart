import 'dart:convert';

class NotasModal {
    NotasModal({
        required this.descripcion,
         this.id,
    });

    String descripcion;
    String? id;

    factory NotasModal.fromJson(String str) => NotasModal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory NotasModal.fromMap(Map<String, dynamic> json) => NotasModal(
        descripcion: json["descripcion"],
        id: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "id": id,
    };

       NotasModal copy() => NotasModal(
        descripcion: descripcion,
        id: id,
    );
}
