import 'package:flutter/material.dart';
import 'package:muslim_app_new/model/doa_model.dart';

class DoaDetailPage extends StatelessWidget {
  final Doa doa;

  const DoaDetailPage({super.key, required this.doa});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          doa.doa,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 109, 212, 243),
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
      body: Stack(children: [
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          // child: Card(
          //   elevation: 5,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  doa.ayat,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  doa.latin,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Artinya:\n${doa.artinya}",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
    // );
  }
}
