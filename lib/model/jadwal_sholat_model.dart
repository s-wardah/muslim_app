import 'dart:convert';

JadwalSholat jadwalSholatFromJson(String str) => JadwalSholat.fromJson(json.decode(str));

String jadwalSholatToJson(JadwalSholat data) => json.encode(data.toJson());

class JadwalSholat {
  bool status;
  Request request;
  Data data;

  JadwalSholat({
    required this.status,
    required this.request,
    required this.data,
  });

  factory JadwalSholat.fromJson(Map<String, dynamic> json) => JadwalSholat(
        status: json["status"],
        request: Request.fromJson(json["request"]),
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request": request.toJson(),
        "data": data.toJson(),
      };
}

class Request {
  String path;

  Request({
    required this.path,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
      };
}

class Data {
  int id;
  String lokasi;
  String daerah;
  List<Jadwal> jadwal;

  Data({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.jadwal,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        lokasi: json["lokasi"],
        daerah: json["daerah"],
        jadwal: List<Jadwal>.from(json["jadwal"].map((x) => Jadwal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lokasi": lokasi,
        "daerah": daerah,
        "jadwal": List<dynamic>.from(jadwal.map((x) => x.toJson())),
      };
}

class Jadwal {
  String tanggal;
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;
  String date;

  Jadwal({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        tanggal: json["tanggal"],
        imsak: json["imsak"],
        subuh: json["subuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashar: json["ashar"],
        maghrib: json["maghrib"],
        isya: json["isya"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "imsak": imsak,
        "subuh": subuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashar": ashar,
        "maghrib": maghrib,
        "isya": isya,
        "date": date,
      };
}