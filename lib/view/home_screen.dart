import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image/image.dart' as img;
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../res/widget/button.dart';
import 'details_screen.dart';
import 'qr_code_proivder.dart';
import 'qr_code_using_camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  final ImagePicker _picker = ImagePicker();

  Future<void> _scanFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final filePath = pickedFile.path;
      final image = img.decodeImage(File(filePath).readAsBytesSync());
      if (image != null) {
        final inputImage = InputImage.fromFilePath(filePath);
        final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
        final barcodes = await barcodeScanner.processImage(inputImage);
        await barcodeScanner.close();

        if (barcodes.isNotEmpty) {
          final qrCode = barcodes.first.rawValue ?? 'No QR Code found';
          context.read<QRCodeProvider>().updateQRCode(qrCode);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QRCodeDetailScreen(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No QR Code found in the image')),
          );
        }
      }
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QRCodeProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;
          final double height = constraints.maxHeight;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: width,
                  height: height * 0.25,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xff0052d4),
                        Color(0xff4364f7),
                        Color(0xff6fb1fc)
                      ],
                      stops: [0, 0.5, 1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    'asset/qr-code.png',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                RoundButton(
                  title: 'Scan Using Camera',
                  content:
                      'Point your camera at QR Code and\nget Stored Information',
                  icon: CupertinoIcons.camera,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QRCodeScannerCamera(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                RoundButton(
                  title: 'Scan Gallery Image',
                  content:
                      'Select Image from gallery and get\nQR code scanned automatically',
                  icon: CupertinoIcons.photo,
                  onTap: _scanFromGallery,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.2,
                      height: height * 0.08,
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff0052d4),
                            Color(0xff4364f7),
                            Color(0xff6fb1fc)
                          ],
                          stops: [0, 0.5, 1],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Icon(
                        Icons.star_rate,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    InkWell(
                      onTap: () async {
                        await Share.share(
                                "https://play.google.com/store/apps/details?id=com.zxtechnologies.onemail")
                            .then((value) {
                          print(value);
                        });
                      },
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.08,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff0052d4),
                              Color(0xff4364f7),
                              Color(0xff6fb1fc)
                            ],
                            stops: [0, 0.5, 1],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.share,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
