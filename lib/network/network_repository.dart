import 'dart:convert';
import 'package:architecture/domain/failure/network_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class NetworkRepository {
  // get put post delete
  // Take a url string as a parameter
  // and return Map<String, dynamic> as json
  // Add do exception handling

  Future<Either<NetworkFailure, dynamic>> get(String url) async {
    try {
      var uri = Uri.parse(url);
      var response = await http.get(uri);
      final failure = _handleStateCode(response.statusCode);
      if (failure != null) {
        left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (e) {
      return left(NetworkFailure(error: e.toString()));
    }
  }

  NetworkFailure? _handleStateCode(int code) {
    if (code == 401) {
      return NetworkFailure(error: 'Unauthorized');
    } else {
      return null;
    }
  }
}
