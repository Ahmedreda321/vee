// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../shared/profile/presentation/widgets/back_button.dart';
import '../../domain/entities/driver_reports_entites.dart';
import 'reports_list_view.dart';

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

