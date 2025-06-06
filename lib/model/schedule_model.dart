class ScheduleModel {
  final String lokasi;
  final String daerah;
  final String tanggal;
  final String imsak;
  final String subuh;
  final String terbit;
  final String dhuha;
  final String dzuhur;
  final String ashar;
  final String maghrib;
  final String isya;

  ScheduleModel({
    required this.lokasi,
    required this.daerah,
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      lokasi: json['data']['lokasi'],
      daerah: json['data']['daerah'],
      tanggal: json['data']['jadwal']['tanggal'],
      imsak: json['data']['jadwal']['imsak'],
      subuh: json['data']['jadwal']['subuh'],
      terbit: json['data']['jadwal']['terbit'],
      dhuha: json['data']['jadwal']['dhuha'],
      dzuhur: json['data']['jadwal']['dzuhur'],
      ashar: json['data']['jadwal']['ashar'],
      maghrib: json['data']['jadwal']['maghrib'],
      isya: json['data']['jadwal']['isya'],
    );
  }
}