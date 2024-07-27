// // import 'dart:io';

// // import 'package:flutter/material.dart';
// // import 'package:google_ml_kit/google_ml_kit.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';
// // import 'package:image/image.dart' as img;

// // class QRcodeScannerScreen extends StatefulWidget {
// //   const QRcodeScannerScreen({super.key});

// //   @override
// //   State<QRcodeScannerScreen> createState() => _QRcodeScannerScreenState();
// // }

// // class _QRcodeScannerScreenState extends State<QRcodeScannerScreen> {
// //   final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
// //   QRViewController? controller;
// //   final ImagePicker _picker = ImagePicker();
// //   String qrCode = "";

// //   @override
// //   void reassemble() {
// //     super.reassemble();
// //     if (Platform.isAndroid) {
// //       controller!.pauseCamera();
// //     } else if (Platform.isIOS) {
// //       controller!.resumeCamera();
// //     }
// //   }

// //   void _onQRViewCreated(QRViewController controller) {
// //     this.controller = controller;
// //     this.controller!.getCameraInfo();
// //     controller.scannedDataStream.listen((scanData) {
// //       final qrCode = scanData.code;
// //       if (qrCode != null) {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => QRCodeDetailScreen(qrCode: qrCode.toString()),
// //           ),
// //         );
// //         print('QR Code: $qrCode');
// //         print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
// //         print('QR Code: ${scanData.code}');
// //       }

// //       print('QR Code: $qrCode');
// //       print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
// //       print('QR Code: ${scanData.code}');
// //     });
// //   }

// //   Future<void> _scanFromGallery() async {
// //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       final filePath = pickedFile.path;
// //       final image = img.decodeImage(File(filePath).readAsBytesSync());
// //       if (image != null) {
// //         final inputImage = InputImage.fromFilePath(filePath);
// //         final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
// //         final barcodes = await barcodeScanner.processImage(inputImage);
// //         await barcodeScanner.close();

// //         if (barcodes.isNotEmpty) {
// //           final qrCode = barcodes.first.rawValue ?? 'No QR Code found';
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => QRCodeDetailScreen(qrCode: qrCode),
// //             ),
// //           );
// //         } else {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(content: Text('No QR Code found in the image')),
// //           );
// //         }
// //       }
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     controller?.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         actions: [
// //           IconButton(onPressed: _scanFromGallery, icon: Icon(Icons.photo))
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             flex: 5,
// //             child: QRView(
// //               key: qrKey,
// //               onQRViewCreated: _onQRViewCreated,
// //             ),
// //           ),
// //           Expanded(
// //             flex: 1,
// //             child: Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   controller!.resumeCamera();
// //                 },
// //                 child: Text('Resume'),
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 20),
// //           Text(
// //             'QR Code Content:',
// //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //           ),
// //           SizedBox(height: 10),
// //           Text(
// //             qrCode,
// //             style: TextStyle(fontSize: 16),
// //             textAlign: TextAlign.center,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class QRCodeDetailScreen extends StatelessWidget {
// //   final String qrCode;

// //   const QRCodeDetailScreen({super.key, required this.qrCode});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('QR Code Details'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               Text(
// //                 'Scanned QR Code Content:',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 20),
// //               Text(
// //                 qrCode,
// //                 style: TextStyle(fontSize: 16),
// //                 textAlign: TextAlign.center,
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:image/image.dart' as img;

// class QRcodeScannerScreen extends StatefulWidget {
//   const QRcodeScannerScreen({super.key});

//   @override
//   State<QRcodeScannerScreen> createState() => _QRcodeScannerScreenState();
// }

// class _QRcodeScannerScreenState extends State<QRcodeScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
//   QRViewController? controller;
//   final ImagePicker _picker = ImagePicker();
//   String qrCode = "";
//   bool isFlashOn = false;
//   bool isFrontCamera = false;

//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       final qrCode = scanData.code;
//       if (qrCode != null) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => QRCodeDetailScreen(qrCode: qrCode.toString()),
//           ),
//         );
//         print('QR Code: $qrCode');
//         print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//         print('QR Code: ${scanData.code}');
//       }

//       print('QR Code: $qrCode');
//       print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
//       print('QR Code: ${scanData.code}');
//     });
//   }

//   Future<void> _scanFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final filePath = pickedFile.path;
//       final image = img.decodeImage(File(filePath).readAsBytesSync());
//       if (image != null) {
//         final inputImage = InputImage.fromFilePath(filePath);
//         final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
//         final barcodes = await barcodeScanner.processImage(inputImage);
//         await barcodeScanner.close();

//         if (barcodes.isNotEmpty) {
//           final qrCode = barcodes.first.rawValue ?? 'No QR Code found';
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => QRCodeDetailScreen(qrCode: qrCode),
//             ),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('No QR Code found in the image')),
//           );
//         }
//       }
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: _scanFromGallery, icon: Icon(Icons.photo))
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Stack(
//               children: [
//                 QRView(
//                   key: qrKey,
//                   onQRViewCreated: _onQRViewCreated,
//                   overlay: QrScannerOverlayShape(
//                     borderColor: Colors.red,
//                     borderRadius: 10,
//                     borderLength: 30,
//                     borderWidth: 10,
//                     cutOutSize: 300,
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: Icon(
//                           isFlashOn ? Icons.flash_on : Icons.flash_off,
//                           color: Colors.white,
//                         ),
//                         onPressed: () async {
//                           await controller?.toggleFlash();
//                           setState(() {
//                             isFlashOn = !isFlashOn;
//                           });
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           isFrontCamera
//                               ? Icons.camera_front
//                               : Icons.camera_rear,
//                           color: Colors.white,
//                         ),
//                         onPressed: () async {
//                           await controller?.flipCamera();
//                           setState(() {
//                             isFrontCamera = !isFrontCamera;
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () {
//                   controller!.resumeCamera();
//                 },
//                 child: Text('Resume'),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'QR Code Content:',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             qrCode,
//             style: TextStyle(fontSize: 16),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class QRCodeDetailScreen extends StatelessWidget {
//   final String qrCode;

//   const QRCodeDetailScreen({super.key, required this.qrCode});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QR Code Details'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Scanned QR Code Content:',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 qrCode,
//                 style: TextStyle(fontSize: 16),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// qr_code_scanner_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';
import 'details_screen.dart';
import 'qr_code_proivder.dart';

class QRCodeScannerCamera extends StatefulWidget {
  const QRCodeScannerCamera({super.key});

  @override
  State<QRCodeScannerCamera> createState() => _QRCodeScannerCameraState();
}

class _QRCodeScannerCameraState extends State<QRCodeScannerCamera> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      final qrCode = scanData.code;
      if (qrCode != null) {
        context.read<QRCodeProvider>().updateQRCode(qrCode.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => QRCodeDetailScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QRCodeProvider>();

    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: _scanFromGallery, icon: Icon(Icons.photo))
      //   ],
      // ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0052d4), Color(0xff4364f7), Color(0xff6fb1fc)],
              stops: [0, 0.5, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            title: const Text('QR Code'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Expanded(
        // flex: 5,
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      provider.isFlashOn ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      provider.toggleFlash();
                      controller?.toggleFlash();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      provider.isFrontCamera
                          ? Icons.camera_front
                          : Icons.camera_rear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      provider.flipCamera();
                      controller?.flipCamera();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
