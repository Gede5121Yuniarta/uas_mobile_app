import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_user_login/model/kost_model.dart';
import 'package:flutter_user_login/model/room_model.dart';

// class ApiService {
//   static const String apiUrl = 'http://127.0.0.1:8000/api/kost';

//   static Future<List<Kost>> fetchKosts() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => Kost.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load kosts');
//     }
//   }
// }
class ApiService {
  static const String apiUrl = 'http://127.0.0.1:8000/api/kost';

  static Future<List<Kost>> fetchKosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Kost.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load kosts');
    }
  }

  static Future<List<Room>> fetchRooms(int kostId) async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/room/$kostId'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Room.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }

  Future<List<dynamic>> fetchKostData(int ownerId) async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/kost/$ownerId'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load kost data');
  }
}
}