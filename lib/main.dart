import 'package:flutter/material.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_doa.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_jadwal_sholat.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_surat.dart';
import 'package:provider/provider.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SuratViewModel()),
        ChangeNotifierProvider(create: (context) => DoaViewModel()),
        ChangeNotifierProvider(create: (context) => JadwalSholatViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
