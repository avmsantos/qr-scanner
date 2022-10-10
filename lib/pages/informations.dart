

import 'package:flutter/material.dart';

import '../models/lista_contratos.dart';

class Informations extends StatelessWidget {
  const Informations({super.key, this.itens});
  final Iten? itens;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itens!.empresa,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black.withOpacity(0.8),
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

