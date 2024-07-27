// qr_code_provider.dart
import 'package:flutter/foundation.dart';

class QRCodeProvider with ChangeNotifier {
  String _qrCode = '';
  bool _isFlashOn = false;
  bool _isFrontCamera = false;

  String get qrCode => _qrCode;
  bool get isFlashOn => _isFlashOn;
  bool get isFrontCamera => _isFrontCamera;

  void updateQRCode(String newQRCode) {
    _qrCode = newQRCode;
    notifyListeners();
  }

  void toggleFlash() {
    _isFlashOn = !_isFlashOn;
    notifyListeners();
  }

  void flipCamera() {
    _isFrontCamera = !_isFrontCamera;
    notifyListeners();
  }
}
