import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vee/core/extensions/navigation_extensions.dart';
import 'package:vee/core/extensions/theme_extensions.dart';

import '../constants/app_assets.dart';

class NotFoundRouteScreen extends StatelessWidget {
  const NotFoundRouteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.assetsSvgsPageNotFoundIcon,
              width: 200,
              height: 200,
            ),
            Text(
              'Page not found',
              style: context.textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => context.back(),
              style: TextButton.styleFrom(),
              child: Text('Go back', style: context.textTheme.headlineSmall),
            )
          ],
        ),
      ),
    );
  }
}


// TODO refactor