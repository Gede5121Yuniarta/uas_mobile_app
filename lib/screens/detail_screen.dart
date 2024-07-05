import 'package:flutter/material.dart';
import 'package:flutter_user_login/model/kost_model.dart';
import 'package:flutter_user_login/model/room_model.dart';
import 'package:flutter_user_login/service/api_service.dart';

// class DetailScreen extends StatelessWidget {
//   final Kost kost;

//   DetailScreen({required this.kost});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(kost.nameKost),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               if (kost.media.isNotEmpty)
//                 SizedBox(
//                   height: 200,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: kost.media.length,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Image.network(
//                           'http://127.0.0.1:8000/${kost.media[index]}',
//                           width: 200,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               SizedBox(height: 16),
//               Text(
//                 kost.nameKost,
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 8),
//               Text(kost.location),
//               SizedBox(height: 8),
//               Text(kost.description),
//               SizedBox(height: 8),
//               Text('Facilities: ${kost.facilities.join(', ')}'),
//               SizedBox(height: 8),
//               Text('Rules: ${kost.rules.join(', ')}'),
//               SizedBox(height: 8),
//               Text('WhatsApp: ${kost.whatsappNumber}'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class DetailScreen extends StatefulWidget {
  final Kost kost;

  DetailScreen({required this.kost});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<List<Room>> futureRooms;

  @override
  void initState() {
    super.initState();
    futureRooms = ApiService.fetchRooms(widget.kost.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kost.nameKost),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.kost.media.isNotEmpty)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.kost.media.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          'http://127.0.0.1:8000/${widget.kost.media[index]}',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(height: 16),
              Text(
                widget.kost.nameKost,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(widget.kost.location),
              SizedBox(height: 8),
              Text(widget.kost.description),
              SizedBox(height: 8),
              Text('Facilities: ${widget.kost.facilities.join(', ')}'),
              SizedBox(height: 8),
              Text('Rules: ${widget.kost.rules.join(', ')}'),
              SizedBox(height: 8),
              Text('WhatsApp: ${widget.kost.whatsappNumber}'),
              SizedBox(height: 16),
              Text('Rooms:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              FutureBuilder<List<Room>>(
                future: futureRooms,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No rooms available'));
                  } else {
                    List<Room> rooms = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: rooms.length,
                      itemBuilder: (context, index) {
                        Room room = rooms[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(room.roomsName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text(room.description),
                              SizedBox(height: 8),
                              if (room.roomsMedia.isNotEmpty)
                                SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: room.roomsMedia.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          'http://127.0.0.1:8000/${room.roomsMedia[index]}',
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}