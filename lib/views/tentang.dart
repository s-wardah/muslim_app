import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TentangPage extends StatefulWidget {
  const TentangPage({super.key});

  @override
  State<TentangPage> createState() => _TentangPageState();
}

class _TentangPageState extends State<TentangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tentang Aplikasi',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          // backgroundColor: const Color.fromARGB(255, 109, 212, 243),
          // elevation: 0,
          // shape: const RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(20),
          //     bottomRight: Radius.circular(20),
          //   ),
          // ),
        ),
        body: Container(
          child: const Center(
            child: SizedBox(
              width: 400,
              height: 350,
              // child: Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Muslim App",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text("Versi: 1.0.0", textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text("Terakhir Diperbarui: 2025",
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text("Deskripsi Singkat:", textAlign: TextAlign.center),
                    Text(
                        "Aplikasi Muslim digital ini adalah aplikasi yang menyediakan layanan membaca al-quran, jadwal sholat dan fitur doa-doa pendek dengan di sertai artinya",
                        textAlign: TextAlign.center),
                    SizedBox(height: 8),
                    Text("📞 Kontak & Dukungan", textAlign: TextAlign.center),
                    Text("Email: alqurandigital@gmail.com",
                        textAlign: TextAlign.center),
                    Text("Website: www.alqurandigital.com",
                        textAlign: TextAlign.center),
                    Text("Instagram: @alqurandigital",
                        textAlign: TextAlign.center),
                  ]),
              // )),
            ),
          ),
        ));
  }
}
