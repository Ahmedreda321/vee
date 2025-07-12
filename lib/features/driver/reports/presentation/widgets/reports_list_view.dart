import 'package:flutter/material.dart';

import '../../domain/entities/driver_reports_entites.dart';
import 'report.dart';

class ReportsListView extends StatelessWidget {
  final List<DriverReportsEntites> data;
  const ReportsListView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final report = data[index];
        return Report(
          report: report,
        );
      },
    );
  }
}
