import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:muslim_app_new/views/doa_page.dart';
import 'package:muslim_app_new/views/jadwal_sholat_page.dart';
import 'package:muslim_app_new/views/tentang.dart';
import 'surat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  List<Map<String, dynamic>> dzikirList = [
    {'name': 'Fajr Prayer', 'checked': false},
    {'name': 'Read Al-Quran', 'checked': false},
    {'name': 'Morning Dzikir', 'checked': false},
    {'name': 'Morning Alms', 'checked': false},
    {'name': 'Dhuha Prayer', 'checked': false},
    {'name': 'Dzuhr Prayer', 'checked': false},
    {'name': 'Asr Prayer', 'checked': false},
    {'name': 'Maghrib Prayer', 'checked': false},
    {'name': 'Isha Prayer', 'checked': false},
    {'name': 'Tarawih Prayer', 'checked': false},
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getFormattedTime() {
    return DateFormat('HH:mm:ss').format(_currentTime);
  }

  String getFormattedDate() {
    return DateFormat('EEEE, dd MMMM yyyy').format(_currentTime);
  }

  void toggleDzikir(int index) {
    setState(() {
      dzikirList[index]['checked'] = !dzikirList[index]['checked'];
    });
  }

  double getDzikirProgress() {
    int completed = dzikirList.where((dzikir) => dzikir['checked']).length;
    return completed / dzikirList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                // color:
                //     const Color.fromARGB(255, 109, 212, 243).withOpacity(0.8),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://png.pngtree.com/thumb_back/fh260/background/20230707/pngtree-blue-islamic-mosque-image_6117322.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getFormattedDate(),
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Cianjur, Indonesia',
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          getFormattedTime(),
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Selamat Datang di Muslim App',
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureButton(
                          icon: Icons.mosque,
                          label: 'Sholat',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const JadwalSholatPage(),
                              ),
                            );
                          },
                        ),
                        FeatureButton(
                          icon: Icons.menu_book,
                          label: 'Quran',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SuratPage(),
                              ),
                            );
                          },
                        ),
                        FeatureButton(
                          icon: Icons.volunteer_activism,
                          label: 'Doa Harian',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DoaPage(),
                              ),
                            );
                          },
                        ),
                        FeatureButton(
                          icon: Icons.info,
                          label: 'Tentang',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TentangPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Progres Harian',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    LinearProgressIndicator(
                      value: getDzikirProgress(),
                      backgroundColor: Colors.grey[300],
                      color: const Color.fromARGB(255, 101, 201, 231),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: dzikirList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Checkbox(
                                value: dzikirList[index]['checked'],
                                onChanged: (value) => toggleDzikir(index),
                              ),
                              title: Text(
                                dzikirList[index]['name'],
                                style: TextStyle(
                                  decoration: dzikirList[index]['checked']
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Gap(20),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal, // Scroll ke samping
                    //   child: Row(
                    //     children: [
                    //       Container(width: 400, height: 100, color: Colors.red),
                    //       Gap(10),
                    //       Container(width: 400, height: 100, color: Colors.blue),
                    //       Gap(10),
                    //       Container(width: 400, height: 100, color: Colors.green),
                    //       Gap(10),
                    //       Container(
                    //           width: 400, height: 100, color: Colors.orange),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const FeatureButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50, // Sesuaikan dengan ukuran radius * 2
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 105, 192, 243),
                  Color.fromARGB(255, 104, 167, 226),
                ],
              ),
            ),
            child: Center(child: Icon(icon, color: Colors.white, size: 30)),
          ),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
