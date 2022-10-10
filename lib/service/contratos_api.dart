import 'package:dio/dio.dart';

class ContratosApi {
  final String api = "http://10.38.9.191/create-token/";

  Future<Response> getContratos() async {
    String uri = '${api}geratokenusuario/';
    final Response response = await Dio(
      BaseOptions(baseUrl: api, headers: {"x-api-token": "05fa595bd5642a498d87bf000a85316b59a6f070f590f2fc5f6e1932358dd3d0",}),
    ).get(uri);
    return response;
  }
}
