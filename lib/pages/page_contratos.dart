import 'package:flutter/material.dart';
import 'package:qr_polo/pages/informations.dart';

import '../controller/contratos_controller.dart';
import '../models/lista_contratos.dart';

class PageContratos extends StatelessWidget {
  const PageContratos({super.key, this.contrato});
  final Iten? contrato;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: getContratos(),
          ),
        ),
      ),
    );
  }

  FutureBuilder<List<Iten>> getContratos() =>
      FutureBuilder<List<Iten>>(
        future: contratosController.getContratos(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final List<Iten> contratos = snapshot.data ?? [];
          final bool contratosCounter = contratos.isNotEmpty;
          if (contratosCounter) {
            return _buildMyContratos(contratos);
          } else {
            return Container();
          }
        },
      );

  _buildMyContratos(List<Iten> contratos) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: contratos.length,
      itemBuilder: (context, index) {
        return Informations(
          itens: contratos[index],          
        );
      },
    );
  }
}
