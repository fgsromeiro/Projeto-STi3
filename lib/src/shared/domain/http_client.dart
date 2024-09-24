// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io' as http;

import 'package:projeto_sti3/src/shared/domain/exceptions.dart';
import 'package:projeto_sti3/src/shared/interface/http_adapter.dart';

class HttpClient implements HttpAdapter {
  final http.HttpClient client;

  HttpClient({
    required this.client,
  });

  @override
  Future<Map<String, dynamic>> get(String url) async {
    try {
      return await get(url);
    } catch (e) {
      throw ServerErrorException('Houve um erro ao realizar a consulta');
    }
  }
}
