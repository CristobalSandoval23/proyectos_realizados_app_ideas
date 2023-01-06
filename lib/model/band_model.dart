// To parse this JSON data, do
//
//     final BandModal = BandModalFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class BandModal {
    BandModal({
        required this.id,
        required this.votes,
        required this.name,
    });

    String id;
    int votes;
    String name;

    factory BandModal.fromJson(String str) => BandModal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory BandModal.fromMap(Map<String, dynamic> json) => BandModal(
        id: json["id"],
        votes: json["votes"],
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "votes": votes,
        "name": name,
    };
}
