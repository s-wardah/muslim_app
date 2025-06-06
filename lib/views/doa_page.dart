import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_doa.dart';
import 'package:muslim_app_new/views/doa_detail_page.dart';

class DoaPage extends StatefulWidget {
  const DoaPage({super.key});

  @override
  _DoaPageState createState() => _DoaPageState();
}

class _DoaPageState extends State<DoaPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DoaViewModel>(context, listen: false).fetchDoa();
  }

  @override
  Widget build(BuildContext context) {
    final doaVM = Provider.of<DoaViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doa Harian",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
          doaVM.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: doaVM.listDoa.length,
                  itemBuilder: (context, index) {
                    final doa = doaVM.listDoa[index];
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          doa.doa,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios,
                            color: Color.fromARGB(255, 109, 212, 243)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoaDetailPage(doa: doa),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
