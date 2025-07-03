import 'package:flutter/material.dart';

import 'driver_trip_card.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.homeTripCard,
    required this.listLength,
  });
  final DriverTripCard homeTripCard;
  final int listLength;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listLength,
      itemBuilder: (context, index) => homeTripCard,
    );
  }
}
