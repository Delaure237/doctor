

import 'package:mobile_scanner/mobile_scanner.dart';
class QRCodeService {
  MobileScannerController controller = MobileScannerController();

  // Fonction pour démarrer le scan
  void startScan() {
    controller.start();
  }

  // Fonction pour arrêter le scan
  void stopScan() {
    controller.stop();
  }

  // Fonction pour traiter le résultat du scan
  void onDetect(BarcodeCapture capture) {
    // Extraire le premier Barcode scanné
    final Barcode? barcode = capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
    if (barcode != null && barcode.rawValue != null) {
      final String code = barcode.rawValue!;
      // Traitement du code (par ex : navigation ou affichage des informations)
      print('QR Code détecté : $code');
      // Vous pouvez appeler une fonction ici pour traiter le code
    }
  }

  // Fonction pour activer ou désactiver le flash
  void toggleFlash() {
    controller.toggleTorch();
  }

  // Fonction pour switcher entre caméra frontale et arrière
  void switchCamera() {
    controller.switchCamera();
  }
}*/
