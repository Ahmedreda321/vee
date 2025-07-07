import 'package:flutter/material.dart';

import '../../../../shared/profile/presentation/widgets/back_button.dart';
import '../../domain/entities/driver_reports_entites.dart';

class DriverReportsLoadedScreen extends StatelessWidget {
  final List<DriverReportsEntites> data;
  const DriverReportsLoadedScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowButton(),
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        title: const Text('Driver Reports'),
      ),
      body: ReportsListView(
        data: data,
      ),
    );
  }
}
//TODO: refactor
class ReportsListView extends StatelessWidget {
  final List<DriverReportsEntites> data;
  const ReportsListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final report = data[index];
        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            leading: Text(report.driverName),
            title: Text(report.decription),
            subtitle: Text(report.date),
          ),
        );
      },
    );
  }
}
