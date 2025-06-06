import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muslim_app_new/views/surat_detail_page.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_surat.dart';

class SuratPage extends StatefulWidget {
  const SuratPage({super.key});

  @override
  _SuratPageState createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<SuratViewModel>(context, listen: false).fetchSurat();
  }

  @override
  Widget build(BuildContext context) {
    final suratVM = Provider.of<SuratViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Daftar Surat Al-Quran",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white60,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
              )),
            ),
            suratVM.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: suratVM.listSurat.length,
                    itemBuilder: (context, index) {
                      final surat = suratVM.listSurat[index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 109, 212, 243),
                            child: Text(
                              surat.nomor.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          title: Text(
                            surat.namaLatin,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "${surat.arti} | ${surat.jumlahAyat} Ayat | ${surat.tempatTurun}",
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]),
                          ),
                          trailing: Text(
                            surat.nama,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SuratDetailPage(surat: surat),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ],
        ));
  }
}
