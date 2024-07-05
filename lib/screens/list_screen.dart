// import 'package:flutter/material.dart';
// import 'package:flutter_user_login/model/kost_model.dart';
// import 'package:flutter_user_login/screens/detail_screen.dart';
// import 'package:flutter_user_login/screens/splash_screen.dart';
// import 'package:flutter_user_login/service/api_service.dart';

// class ListScreen extends StatefulWidget {
//   @override
//   _ListScreenState createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   late Future<List<Kost>> futureKosts;

//   @override
//   void initState() {
//     super.initState();
//     futureKosts = ApiService.fetchKosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Kost'),
//       ),
//       body: FutureBuilder<List<Kost>>(
//         future: futureKosts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No data available'));
//           } else {
//             List<Kost> kosts = snapshot.data!;
//             return ListView.builder(
//               itemCount: kosts.length,
//               itemBuilder: (context, index) {
//                 Kost kost = kosts[index];
//                 return ListTile(
//                   leading: kost.media.isNotEmpty
//                       ? Image.network(
//                           'http://127.0.0.1:8000/${kost.media[0]}',
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         )
//                       : null,
//                   title: Text(kost.nameKost),
//                   subtitle: Text(kost.location),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailScreen(kost: kost),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
// class ListScreen extends StatefulWidget {
//   @override
//   _ListScreenState createState() => _ListScreenState();
// }

// class _ListScreenState extends State<ListScreen> {
//   late Future<List<Kost>> futureKosts;
//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     futureKosts = ApiService.fetchKosts();
//   }

//   void _onItemTapped(int index) {
//     if (index == 0) {
//       // Jika tombol "Cari" ditekan, tetap di ListScreen
//       setState(() {
//         _selectedIndex = index;
//       });
//     } else if (index == 1) {
//       // Jika tombol "Masuk" ditekan, navigasi ke LoginScreen
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SplashScreen()),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daftar Kost'),
//       ),
//       body: FutureBuilder<List<Kost>>(
//         future: futureKosts,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No data available'));
//           } else {
//             List<Kost> kosts = snapshot.data!;
//             return ListView.builder(
//               itemCount: kosts.length,
//               itemBuilder: (context, index) {
//                 Kost kost = kosts[index];
//                 return ListTile(
//                   leading: kost.media.isNotEmpty
//                       ? Image.network(
//                           'http://127.0.0.1:8000/${kost.media[0]}',
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         )
//                       : null,
//                   title: Text(kost.nameKost),
//                   subtitle: Text(kost.location),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailScreen(kost: kost),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Cari',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.login),
//             label: 'Masuk',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_user_login/model/kost_model.dart';
import 'package:flutter_user_login/screens/detail_screen.dart';
import 'package:flutter_user_login/screens/splash_screen.dart';
import 'package:flutter_user_login/service/api_service.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Kost>> futureKosts;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    futureKosts = ApiService.fetchKosts();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        _selectedIndex = index;
      });
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png', // Ganti dengan path logo Anda
              height: 40,
            ),
            Icon(Icons.notifications),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari tema atau kata kunci...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 100.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/iklan.png'), // Ganti dengan path gambar iklan Anda
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Kost>>(
        future: futureKosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<Kost> kosts = snapshot.data!;
            return ListView.builder(
              itemCount: kosts.length,
              itemBuilder: (context, index) {
                Kost kost = kosts[index];
                return ListTile(
                  leading: kost.media.isNotEmpty
                      ? Image.network(
                          'http://127.0.0.1:8000/${kost.media[0]}',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : null,
                  title: Text(kost.nameKost),
                  subtitle: Text(kost.location),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(kost: kost),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Masuk',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
