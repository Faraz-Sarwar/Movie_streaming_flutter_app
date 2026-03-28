import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies_app/data/app_exceptions.dart';
import 'package:movies_app/model/movie_model.dart';

class NetworkApiServices {
  dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 404:
        throw NotFoundException(response.statusCode.toString());
      default:
        throw FetchDataException("Unkown error");
    }
  }

  Future<dynamic> fetchMovies(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      return handleResponse(response);
    } on TimeoutException {
      throw FetchDataException('Request timed out');
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }
}
