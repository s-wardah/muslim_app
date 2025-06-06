import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muslim_app_new/model/surat_model.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_surat.dart';

class SuratDetailPage extends StatefulWidget {
  final Surat surat;

  const SuratDetailPage({super.key, required this.surat});

  @override
  _SuratDetailPageState createState() => _SuratDetailPageState();
}

class _SuratDetailPageState extends State<SuratDetailPage> {
  DetailSurat? detailSurat;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDetailSurat();
  }

  void _loadDetailSurat() async {
    final data = await Provider.of<SuratViewModel>(
      context,
      listen: false,
    ).fetchDetailSurat(widget.surat.nomor);
    if (mounted) {
      setState(() {
        detailSurat = data;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.surat.namaLatin,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 109, 212, 243),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 105, 192, 243),
                  Color.fromARGB(255, 104, 167, 226),
                ],
              ),
            ),
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : detailSurat == null
              ? const Center(child: Text("Gagal memuat data"))
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount:
                      detailSurat!.ayat.length +
                      (widget.surat.nomor != 1
                          ? 1
                          : 0), // Menambahkan Bismillah jika bukan Al-Fatihah
                  itemBuilder: (context, index) {
                    if (index == 0 && widget.surat.nomor != 1) {
                      // Tidak tampilkan Bismillah untuk Al-Fatihah
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      final ayat =
                          detailSurat!.ayat[index -
                              (widget.surat.nomor != 1
                                  ? 1
                                  : 0)]; // Offset jika Bismillah tidak ditampilkan
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ayat.teksArab,
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "(${ayat.nomorAyat}) ${ayat.teksLatin}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                ayat.arti,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
        ],
      ),
    );
  }
}
