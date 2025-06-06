import 'dart:convert';

List<Surat> suratFromJson(String str) =>
    List<Surat>.from(json.decode(str)["data"].map((x) => Surat.fromJson(x)));

class Surat {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;

  Surat({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
  });

  factory Surat.fromJson(Map<String, dynamic> json) => Surat(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
      );
}

// Model untuk detail surat dan ayat
DetailSurat detailSuratFromJson(String str) =>
    DetailSurat.fromJson(json.decode(str)["data"]);

class DetailSurat {
  int nomor;
  String namaLatin;
  List<Ayat> ayat;

  DetailSurat({
    required this.nomor,
    required this.namaLatin,
    required this.ayat,
  });

  factory DetailSurat.fromJson(Map<String, dynamic> json) => DetailSurat(
        nomor: json["nomor"],
        namaLatin: json["namaLatin"],
        ayat: List<Ayat>.from(json["ayat"].map((x) => Ayat.fromJson(x))),
      );
}

class Ayat {
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String arti;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.arti,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        arti: json["teksIndonesia"],
      );
}
