import 'package:flutter/material.dart';
import 'package:vee/features/driver/home/domain/entities/driver_home_entities.dart';

// import '../../../../../core/services/map_serv.dart';
import '../../../../../core/services/map_services/map_screen.dart';
import '../../../../../core/theme/app_colors.dart';

class MapView extends StatelessWidget {
  final TripEntity trip;
  const MapView({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return MapScreen(
      tripId: trip.id,
      destinationLocationNominatimLink:
          trip.destinationLocationNominatimLink,
      pickupLocationNominatimLink: trip.pickupLocationNominatimLink,
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return AlertDialog(
                  title: const Text("Finish Trip"),
                  content: const Text("Do you have any issues?"),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text("yes",
                          style: TextStyle(color: AppColor.black)),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("no",
                          style: TextStyle(color: AppColor.red)),
                    ),
                  ],
                );
              });
        },
        child: const Text("Finish Trip"),
      ),
    );
  }
}

//TODO: refactor