import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_polo/pages/page_contratos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
  }

  String ticket = '';
  List<String> tickets = [];
  readQRCode() async {
    String code = await FlutterBarcodeScanner.scanBarcode(
      "#FFFFFF",
      "Cancelar",
      false,
      ScanMode.QR,
    );
    setState(() => ticket = code != '-1' ? code : 'Não validado');
    if (ticket != '') {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => const PageContratos()));
    } else {
      const Text('uahsuiasguasguasd');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const QrCode(),
      floatingActionButton: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
                label: const Text('Ler QR-Code'),
                tooltip: 'VOCE É UM PIRU',
                onPressed: readQRCode),
          ],
        ),
      ),
    );
  }
}

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 250,
        ),
      ),
    );
  }
}
