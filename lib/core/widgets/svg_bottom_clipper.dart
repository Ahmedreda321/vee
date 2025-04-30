import 'dart:typed_data';
import 'package:flutter/widgets.dart';
import 'package:path_drawing/path_drawing.dart';

/// CustomClipper that clips a widget to the SVG path defined in subtract.xml
class SvgBottomClipper extends CustomClipper<Path> {
  // SVG pathData extracted from subtract.xml
  static const String _pathData =
      'M360 103H70C31.3401 103 0.000000354389 134.34 0 173V0H360V103Z';

  @override
  Path getClip(Size size) {
    // 1. Parse the SVG pathData into a Flutter Path
    final Path originalPath = parseSvgPathData(_pathData);

    // 2. Compute scaling factors based on the original viewport (360×173)
    final double scaleX = size.width / 360;
    final double scaleY = size.height / 173;

    // 3. Build a 4x4 transformation matrix for scaling
    final Matrix4 transformMatrix = Matrix4.identity()..scale(scaleX, scaleY);

    // 4. Extract the Float64List to feed into Path.transform()
    final Float64List matrixStorage = transformMatrix.storage;

    // 5. Apply the transform and return the clipped Path
    return originalPath.transform(matrixStorage);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
