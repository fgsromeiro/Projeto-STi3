// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:projeto_sti3/src/shared/domain/exceptions.dart';
import 'package:projeto_sti3/src/shared/interface/http_adapter.dart';

class HttpClient implements HttpAdapter {
  final http.Client client;

  HttpClient({
    required this.client,
  });

  @override
  Future<String> get(String url) async {
    try {
      var map = await client.get(
        Uri.parse(url),
      );

      return map.body;
    } catch (e) {
      log(e.toString());
      throw ServerErrorException('Houve um erro ao realizar a consulta');
    }
  }
}
