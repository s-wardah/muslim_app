import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:muslim_app_new/viewmodel/viewmodel_schedule.dart';

class SholatScheduleScreen extends StatefulWidget {
  const SholatScheduleScreen({super.key});

  @override
  State<SholatScheduleScreen> createState() => _SholatScheduleScreenState();
}

class _SholatScheduleScreenState extends State<SholatScheduleScreen> {
  String locationId = '1206';
  int year = 2024;
  int month = 1;
  int day = 31;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<ScheduleViewModel>()
          .fetchSholatSchedule(locationId, year, month, day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Jadwal Sholat',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<ScheduleViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.errorMessage != null) {
            return Center(child: Text(viewModel.errorMessage!));
          } else if (viewModel.schedule == null) {
            return const Center(child: Text('No schedule available.'));
          } else {
            final schedule = viewModel.schedule!;
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lokasi: ${schedule.lokasi}, ${schedule.daerah}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('Tanggal: ${schedule.tanggal}'),
                    const SizedBox(height: 16),
                    Text('Imsak: ${schedule.imsak}'),
                    Text('Subuh: ${schedule.subuh}'),
                    Text('Terbit: ${schedule.terbit}'),
                    Text('Dhuha: ${schedule.dhuha}'),
                    Text('Dzuhur: ${schedule.dzuhur}'),
                    Text('Ashar: ${schedule.ashar}'),
                    Text('Maghrib: ${schedule.maghrib}'),
                    Text('Isya: ${schedule.isya}'),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
