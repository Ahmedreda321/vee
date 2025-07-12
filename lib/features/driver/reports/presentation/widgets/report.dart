
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/core/utils/app_border_radius.dart';
import 'package:vee/core/utils/app_margin.dart';

import '../../domain/entities/driver_reports_entites.dart';
import 'detail_row.dart';

class Report extends StatelessWidget {
  final DriverReportsEntites report;
  const Report({super.key, required this.report});
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: AppMargin.small,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey[50],
        borderRadius: AppBorderRadius.smallBorder,
      ),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: _getStatusColor(report.status),
          child: Text(
            report.status[0].toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          report.driverName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          '${report.date} • ${report.status}',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey[600],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10.h,
              children: [
                DetailRow(label: 'Driver Name', value: report.driverName),
                DetailRow(label: 'Status', value: report.status),
                DetailRow(label: 'Date', value: report.date),
                DetailRow(label: 'Vehicle Number', value: report.vehicleNumber),
                DetailRow(label: 'Description', value: report.decription),
                DetailRow(label: 'Report ID', value: report.id),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
