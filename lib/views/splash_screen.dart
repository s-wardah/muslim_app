import 'package:flutter/material.dart';
import 'dart:async';

import 'package:muslim_app_new/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // Untuk efek fade-in
  double _scale = 0.8; // Untuk efek zoom-in

  @override
  void initState() {
    super.initState();

    // Mulai animasi setelah delay sedikit
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });

    // Timer untuk pindah ke HomePage
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, // Background putih
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: _opacity,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: 250,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17),
                  child: Image.asset(
                    'assets/muslim_app.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
