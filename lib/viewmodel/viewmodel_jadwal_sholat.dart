import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app_new/model/jadwal_sholat_model.dart';

class JadwalSholatViewModel extends ChangeNotifier {
  JadwalSholat? _jadwalSholat;

  JadwalSholat? get jadwalSholat => _jadwalSholat;

  Future<void> fetchJadwal() async {
    final response = await http
        .get(Uri.parse('https://api.myquran.com/v2/sholat/jadwal/1206/2025/1'));

    if (response.statusCode == 200) {
      _jadwalSholat = jadwalSholatFromJson(response.body);
      notifyListeners();
    } else {
      throw Exception('Failed to load jadwal sholat');
    }
  }
}
