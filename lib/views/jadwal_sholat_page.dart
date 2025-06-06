import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muslim_app_new/model/jadwal_sholat_model.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_jadwal_sholat.dart';
import 'dart:async';
import 'package:gap/gap.dart';

class JadwalSholatPage extends StatefulWidget {
  const JadwalSholatPage({super.key});

  @override
  _JadwalSholatPageState createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
  late Timer timer;
  late String currentDate;
  late String currentTime;

  @override
  void initState() {
    super.initState();
    Provider.of<JadwalSholatViewModel>(context, listen: false).fetchJadwal();
    currentDate = _formatDate(DateTime.now());
    currentTime = _formatTime(DateTime.now());

    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        currentDate = _formatDate(DateTime.now());
        currentTime = _formatTime(DateTime.now());
      });
    });
  }

  String _formatDate(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.year}";
  }

  String _formatTime(DateTime dateTime) {
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Jadwal Sholat',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 105, 192, 243),
            Color.fromARGB(255, 104, 167, 226),
          ],
        )),
        child: Consumer<JadwalSholatViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.jadwalSholat == null) {
              return const Center(child: CircularProgressIndicator());
            }

            String today = DateTime.now().toString().split(' ')[0];
            Jadwal currentJadwal =
                viewModel.jadwalSholat!.data.jadwal.firstWhere(
              (j) => j.tanggal == today,
              orElse: () => viewModel.jadwalSholat!.data.jadwal[0],
            );

            return Stack(
              children: [
                Column(
                  children: [
                    const Gap(50),
                    Container(
                      // padding: const EdgeInsets.all(16),
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      //   borderRadius: BorderRadius.circular(
                      //       20), // ubah menjadi BorderRadius.circular(20)
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Colors.grey.withOpacity(0.5),
                      //       spreadRadius: 5,
                      //       blurRadius: 7,
                      //       offset:
                      //           const Offset(0, 3), // changes position of shadow
                      //     ),
                      //   ],
                      // ),

                      child: Column(
                        children: [
                          const Gap(10),
                          Text(
                            currentTime,
                            style: const TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            currentDate,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildPrayerTimeTile("Imsak", currentJadwal.imsak),
                          _buildPrayerTimeTile("Subuh", currentJadwal.subuh),
                          _buildPrayerTimeTile("Terbit", currentJadwal.terbit),
                          _buildPrayerTimeTile("Dhuha", currentJadwal.dhuha),
                          _buildPrayerTimeTile("Dzuhur", currentJadwal.dzuhur),
                          _buildPrayerTimeTile("Ashar", currentJadwal.ashar),
                          _buildPrayerTimeTile(
                              "Maghrib", currentJadwal.maghrib),
                          _buildPrayerTimeTile("Isya", currentJadwal.isya),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      scrollDirection: Axis.horizontal, // Scroll ke samping
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.pinimg.com/474x/b8/ac/38/b8ac38dbe916089c86bf2b84980b8602.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              // Pusatkan teks secara vertikal dan horizontal
                              child: Text(
                                "Barangsiapa yang ingin ditolong Allah saat tertimpa malapetaka dan kesempitan, maka perbanyaklah berdoa di saat lapang. (HR. Tirmidzi)",
                                textAlign: TextAlign
                                    .center, // Pusatkan teks secara horizontal
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.pinimg.com/474x/b8/ac/38/b8ac38dbe916089c86bf2b84980b8602.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "Barangsiapa masuk kubur tanpa bekal, ia seperti mengarungi laut tanpa perahu. (Abu Bakar)",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.pinimg.com/474x/b8/ac/38/b8ac38dbe916089c86bf2b84980b8602.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "Wahai yang membolak-balikkan hati, tetapkanlah hatiku di atas agamaMu. (HR. Tirmidzi)",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                          const Gap(20),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            width: 400,
                            height: 200,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://i.pinimg.com/474x/b8/ac/38/b8ac38dbe916089c86bf2b84980b8602.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                "Nikmat sehat akan terasa jika kita pernah sakit. Nikmat harta akan terasa jika kita pernah susah, dan nikmat hidup akan terasa jika kita pernah mendapatkan musibah. Musibah adalah awal dari kenikmatan hidup... Bahagianya hidup dengan manisnya iman dan menjadikan Allah sebagai tujuan hidup.",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPrayerTimeTile(String title, String time) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(time, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
