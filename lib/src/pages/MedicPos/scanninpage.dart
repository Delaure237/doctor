import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'service.dart'; // Import du service QR code

class ScanMedecineQrCode extends StatefulWidget {
  const ScanMedecineQrCode({super.key});

  @override
  ScanMedecineQrCodeState createState() => ScanMedecineQrCodeState();
}

class ScanMedecineQrCodeState extends State<ScanMedecineQrCode> {
  final QRCodeService qrCodeService = QRCodeService(); // Instance du service QR code

  @override
  void initState() {
    super.initState();
    qrCodeService.startScan(); // Démarrer le scan au chargement de la page
  }

  @override
  void dispose() {
    qrCodeService.stopScan(); // Arrêter le scan quand la page est fermée
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Titre principal
            const Text(
              'Please Scan the QR Code!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We will automatically add the prescribed medication stated in the doctor\'s prescription after scanning.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            // MobileScanner widget pour afficher le scan du QR code
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: MobileScanner(
                controller: qrCodeService.controller,
                onDetect: qrCodeService.onDetect, // Utilisation du service QR
              ),
            ),
            const SizedBox(height: 30),
            // Boutons pour "Scan" et annulation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    qrCodeService.startScan(); // Relancer le scan
                  },
                  child: const Text('Scan Again'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    qrCodeService.stopScan(); // Arrêter le scan
                    Navigator.pop(context); // Fermer la page
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
