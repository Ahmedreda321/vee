import 'package:flutter/material.dart';

import 'home_trip_card.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.homeTripCard,
    required this.listLength,
  });
  final HomeTripCard homeTripCard;
  final int listLength;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listLength,
      itemBuilder: (context, index) => homeTripCard,
    );
  }
}
