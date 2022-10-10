import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/lista_contratos.dart';
import '../service/contratos_api.dart';

class ContratosController {
  final contratosApi = ContratosApi();

  Future<List<Iten>> getContratos() async {
    final Response response = await contratosApi.getContratos();
    List<Iten> contratos = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final dataFromAPI = jsonDecode(response.data);
      final List<dynamic> contratosResults = dataFromAPI["results"];

      contratos =
          contratosResults.map((json) => Iten.fromJson(json)).toList();
    }
    return contratos;
  }
}

final contratosController = ContratosController();
