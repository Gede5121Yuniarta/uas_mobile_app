import 'dart:convert';

class Room {
  final int id;
  final int kostId;
  final String roomsName;
  final String status;
  final String description;
  final List<String> roomsMedia;

  Room({
    required this.id,
    required this.kostId,
    required this.roomsName,
    required this.status,
    required this.description,
    required this.roomsMedia,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      kostId: json['kost_id'],
      roomsName: json['rooms_name'],
      status: json['status'],
      description: json['description'],
      roomsMedia: List<String>.from(jsonDecode(json['rooms_media'])),
    );
  }
}
