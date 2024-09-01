import 'package:flutter/material.dart';
import 'package:yaaqin/feature/jonaBersih/index.dart';
import 'package:yaaqin/feature/jonaKirim/index.dart';
import 'package:yaaqin/feature/jonaPindahan/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0, // Hides the app bar
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Text
            Text(
              'Hai, Selamat Datang di Jona!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F3721),
              ),
            ),
            SizedBox(height: 16),

            // Address Card
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat Kamu',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 47, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on,
                              color: const Color.fromARGB(255, 255, 166, 32)),
                          SizedBox(width: 8),
                          Text('Isi Alamat Kamu dulu'),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Isi Alamat'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Service Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                _buildServiceIcon(
                    context, 'Jona Bersih', Icons.cleaning_services),
                _buildServiceIcon(context, 'Jona Kirim', Icons.local_shipping),
                _buildServiceIcon(context, 'Jona Pindahan', Icons.local_movies),
                _buildServiceIcon(context, 'Jona Benerin', Icons.build),
              ],
            ),
            SizedBox(height: 16),

            // Placeholder for 4 blocks
            Expanded(
              child: GridView.builder(
                itemCount: 4, // Number of blocks
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceIcon(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Jona Bersih') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JasaBersihBersihPage()),
          );
        } else if (title == 'Jona Kirim') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JasaKirimPage()),
          );
        } else if (title == 'Jona Pindahan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JasaPindahanPage()),
          );
        }
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow[100],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(16),
            child: Icon(
              icon,
              size: 32,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 8),
          Text(title),
        ],
      ),
    );
  }
}
