// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:vee/core/services/logger_service.dart';

// import '../../features/driver/home/presentation/cubits/cubit/map_screen_cubit.dart';
// import '../../features/driver/home/presentation/cubits/cubit/map_screen_state.dart';

// class MeterReadingProcessor {
//   static final TextRecognizer _textRecognizer = TextRecognizer();

//   static Future<Map<String, String?>> processMeterImage(String imagePath) async {
//     try {
//       final inputImage = InputImage.fromFilePath(imagePath);
//       final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);
      
//       // Extract numbers from the recognized text
//       final extractedData = _extractMeterData(recognizedText.text);
      
//       return extractedData;
//     } catch (e) {
//       AppLogger.e('Error processing meter image: $e');
//       return {
//         'meterReading': null,
//         'fuelLevel': null,
//         'mileage': null,
//         'error': e.toString(),
//       };
//     }
//   }

//   static Map<String, String?> _extractMeterData(String text) {
//     // Regular expressions to find different meter readings
//     final meterReadingRegex = RegExp(r'\b\d{4,6}\b'); // 4-6 digit numbers for odometer
//     final fuelLevelRegex = RegExp(r'\b\d{1,3}%?\b'); // 1-3 digit numbers for fuel level
//     final mileageRegex = RegExp(r'\b\d{1,4}\.\d{1,2}\b'); // Decimal numbers for mileage
    
//     final lines = text.split('\n');
//     String? meterReading;
//     String? fuelLevel;
//     String? mileage;
    
//     for (String line in lines) {
//       line = line.trim();
      
//       // Look for odometer reading (usually the longest number)
//       if (meterReading == null) {
//         final meterMatch = meterReadingRegex.firstMatch(line);
//         if (meterMatch != null) {
//           final number = meterMatch.group(0);
//           if (number != null && number.length >= 4) {
//             meterReading = number;
//           }
//         }
//       }
      
//       // Look for fuel level (usually has % or is near fuel-related keywords)
//       if (fuelLevel == null) {
//         if (line.toLowerCase().contains('fuel') || 
//             line.toLowerCase().contains('gas') || 
//             line.toLowerCase().contains('%')) {
//           final fuelMatch = fuelLevelRegex.firstMatch(line);
//           if (fuelMatch != null) {
//             fuelLevel = fuelMatch.group(0)?.replaceAll('%', '');
//           }
//         }
//       }
      
//       // Look for mileage (decimal numbers)
//       if (mileage == null) {
//         final mileageMatch = mileageRegex.firstMatch(line);
//         if (mileageMatch != null) {
//           mileage = mileageMatch.group(0);
//         }
//       }
//     }
    
//     return {
//       'meterReading': meterReading,
//       'fuelLevel': fuelLevel,
//       'mileage': mileage,
//     };
//   }

//   static Future<void> dispose() async {
//     await _textRecognizer.close();
//   }
// }

// // Extension to enhance the MapScreenCubit with ML Kit processing
// extension MeterReadingCubit on MapScreenCubit {
//   Future<void> processMeterReadingWithMLKit() async {
//     if (capturedImagePath == null) return;
    
//     try {
//       emit(const MapScreenState.processingMeterReading());
      
//       final result = await MeterReadingProcessor.processMeterImage(capturedImagePath!);
      
//       if (result['error'] != null) {
//         emit(const MapScreenState.meterReadingFailed());
//         return;
//       }
      
//       // Auto-fill the controllers if data was extracted successfully
//       if (result['meterReading'] != null) {
//         meterReadingController.text = result['meterReading']!;
//       }
//       if (result['fuelLevel'] != null) {
//         fuelLevelController.text = result['fuelLevel']!;
//       }
//       if (result['mileage'] != null) {
//         mileageController.text = result['mileage']!;
//       }
      
//       // Check if we got at least one reading
//       if (result['meterReading'] != null || 
//           result['fuelLevel'] != null || 
//           result['mileage'] != null) {
//         emit(const MapScreenState.meterReadingProcessed());
//       } else {
//         emit(const MapScreenState.meterReadingFailed());
//       }
      
//     } catch (e) {
//       emit(MapScreenState.meterReadingError(e.toString()));
//     }
//   }
// }