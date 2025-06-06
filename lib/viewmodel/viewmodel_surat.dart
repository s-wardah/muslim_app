import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app_new/model/surat_model.dart';

class SuratViewModel extends ChangeNotifier {
  List<Surat> _listSurat = [];
  bool _isLoading = false;

  List<Surat> get listSurat => _listSurat;
  bool get isLoading => _isLoading;

  Future<void> fetchSurat() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://equran.id/api/v2/surat");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _listSurat = suratFromJson(response.body);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<DetailSurat?> fetchDetailSurat(int nomor) async {
    final url = Uri.parse("https://equran.id/api/v2/surat/$nomor");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return detailSuratFromJson(response.body);
      }
    } catch (e) {
      print("Error: $e");
    }
    return null;
  }
}
