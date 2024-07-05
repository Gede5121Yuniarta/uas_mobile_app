import 'dart:convert';

class Kost {
  final int id;
  final String nameKost;
  final String location;
  final String description;
  final List<String> media;
  final String whatsappNumber;
  final List<String> facilities;
  final List<String> rules;

  Kost({
    required this.id,
    required this.nameKost,
    required this.location,
    required this.description,
    required this.media,
    required this.whatsappNumber,
    required this.facilities,
    required this.rules,
  });

  factory Kost.fromJson(Map<String, dynamic> json) {
    return Kost(
      id: json['id'],
      nameKost: json['name_kost'],
      location: json['location'],
      description: json['description'],
      media: (json['media'] as String).split(','),
      whatsappNumber: json['whatsapp_number'],
      facilities: List<String>.from(jsonDecode(json['facilities'])),
      rules: List<String>.from(jsonDecode(json['rules'])),
    );
  }
}
