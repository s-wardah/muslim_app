import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:muslim_app_new/model/doa_model.dart';

class DoaViewModel extends ChangeNotifier {
  List<Doa> _listDoa = [];
  bool _isLoading = false;

  List<Doa> get listDoa => _listDoa;
  bool get isLoading => _isLoading;

  Future<void> fetchDoa() async {
    _isLoading = true;
    notifyListeners();

    final url =
        Uri.parse("http://localhost:3000/api");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _listDoa = doaFromJson(response.body);
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}