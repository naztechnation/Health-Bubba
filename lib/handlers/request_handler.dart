import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../utils/exceptions.dart';
import 'app_handlers.dart';

class RequestHandler {
  static String handleServerError(Response response) {
    AppHandler.logPrint("Response status: ${response.statusCode}");
    AppHandler.logPrint("Response body: ${response.body}");
    final map = json.decode(response.body);

    switch (response.statusCode) {
      case 201:
        throw NetworkException("${response.statusCode}");
        
      case 200:
        return response.body;
      case 400:
        return response.body;

      case 401:
      return response.body;
      case 409:
        return response.body;

      case 403:
        throw NetworkException("${response.statusCode}");
      case 404:
        throw NetworkException("${response.statusCode}");

      case 422:
        throw NetworkException("${response.statusCode}");
      case 500:
        throw NetworkException("${response.statusCode}");
      default:
        throw NetworkException("${response.statusCode}");
    }
  }

  static Future<String> handleStreamedServerError(
      StreamedResponse response) async {
    List res = [];
    await response.stream.forEach((message) {
      res.add(String.fromCharCodes(message));
      debugPrint(String.fromCharCodes(message));
    });
    AppHandler.logPrint("Response status: ${response.statusCode}");
    AppHandler.logPrint("Response body: ${res.join('')}");
    final map = json.decode(res.join(''));

    switch (response.statusCode) {
      case 201:
        return res.join('');
      case 200:
        return res.join('');
      case 400:
         return res.join('');
         case 409:
        return res.join('');
      case 401:
        return res.join('');

      case 403:
        throw NetworkException("${response.statusCode}");
      case 404:
        throw NetworkException("${response.statusCode}");
      case 422:
        throw NetworkException("${response.statusCode}");
      case 500:
        throw NetworkException("${response.statusCode}");
      default:
        throw NetworkException("${response.statusCode}");
    }
  }
}
