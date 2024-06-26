import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:retry/retry.dart';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';

import '../../handlers/request_handler.dart';
import '../../res/app_strings.dart';
import '../../utils/exceptions.dart';
import 'headers.dart';

class Requests {
  Future<dynamic> get(String route, {Map<String, String>? headers}) async {
    late dynamic map;
    debugPrint(route);
    final client = RetryClient(http.Client());
    try {
      await client
          .get(Uri.parse(route), headers: headers ?? await formDataHeader())
          .then((response) {
        map = json.decode(RequestHandler.handleServerError(response));
      });
    } on SocketException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on HandshakeException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on FormatException catch (e) {
      throw NetworkException(e.toString());
    } finally {
      client.close();
    }
    return map;
  }

  Future<dynamic> post(String route,
      {Map<String, String>? headers,
      dynamic body,
      Map<String, List<File>>? files,
      Encoding? encoding,
      RetryOptions? retryOption}) async {
    late dynamic map;
    debugPrint(route);
    try {
      if (files != null) {
        final request = http.MultipartRequest('POST', Uri.parse(route));
        request.headers.addAll(headers ?? await formDataHeader());
        if (body != null) request.fields.addAll(body as Map<String, String>);
        for (var entry in files.entries) {
        for (var file in entry.value) {
          request.files.add(await http.MultipartFile.fromPath(
            entry.key,
            file.path,
            contentType: MediaType('image', path.extension(file.path).substring(1)),
          ));
        }
      }
        final response = retryOption != null
            ? await retryOption.retry(() => request.send())
            : await retry(
                () => request.send(),
                retryIf: (e) => e is SocketException || e is TimeoutException,
              );
        map = json
            .decode(await RequestHandler.handleStreamedServerError(response));
      } else {
        final client = RetryClient(http.Client());
        await client
            .post(
          Uri.parse(route),
          body: body,
          headers: headers ?? await formDataHeader(),
        )
            .then((response) {
          map = json.decode(RequestHandler.handleServerError(response));
          client.close();
        });
      }
    } on SocketException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on HandshakeException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on FormatException catch (e) {
      throw NetworkException(e.toString());
    }

    return map;
  }

  Future<dynamic> put(String route,
      {Map<String, String>? headers,
      Map<String, dynamic>? body,
      Map<String, File>? files,
      Encoding? encoding,
      RetryOptions? retryOption}) async {
    debugPrint(route);
    late dynamic map;
    try {
      if (files != null) {
        var request = http.MultipartRequest('PUT', Uri.parse(route));
        request.headers.addAll(headers ?? await formDataHeader());
        if (body != null) request.fields.addAll(body as Map<String, String>);
        files.forEach((key, value) async {
          request.files.add(await http.MultipartFile.fromPath(key, value.path,
              filename: path.basename(value.path)));
        });

        final response = retryOption != null
            ? await retryOption.retry(() => request.send())
            : await retry(
                () => request.send(),
                retryIf: (e) => e is SocketException || e is TimeoutException,
              );
        map = json
            .decode(await RequestHandler.handleStreamedServerError(response));
      } else {
        final client = RetryClient(http.Client());
        await client
            .put(Uri.parse(route),
                body: json,
                headers: headers ?? await formDataHeader(),
                encoding: encoding)
            .then((response) {
          map = json.decode(RequestHandler.handleServerError(response));
          client.close();
        });
      }
    } on SocketException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on HandshakeException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on FormatException catch (e) {
      throw NetworkException(e.toString());
    }

    return map;
  }

  Future<dynamic> patch(
    String route, {
    Map<String, String>? headers,
    var body,
    Map<String, File>? files,
    Encoding? encoding,
  }) async {
    debugPrint(route);

    late dynamic map;
    try {
      await http
          .patch(
        Uri.parse(route),
        body: json.encode(body),
        headers: headers ?? await rawDataHeader(),
      )
          .then((response) {
        map = json.decode(RequestHandler.handleServerError(response));
      });
    } on SocketException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on HandshakeException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on FormatException catch (e) {
      throw NetworkException(e.toString());
    }

    return map;
  }

  Future<dynamic> delete(String route, {Map<String, String>? headers}) async {
    late dynamic map;
    debugPrint(route);

    final client = RetryClient(http.Client());
    try {
      await client
          .delete(Uri.parse(route), headers: headers ?? await rawDataHeader())
          .then((response) {
        map = json.decode(RequestHandler.handleServerError(response));
      });
    } on SocketException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on HandshakeException {
      throw NetworkException(AppStrings.networkErrorMessage);
    } on FormatException catch (e) {
      throw NetworkException(e.toString());
    } finally {
      client.close();
    }

    return map;
  }

  Future<void> _uploadImage(File imageFile) async {
    final uri = Uri.parse(AppStrings.uploadimageUrl);
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final responseData = json.decode(responseBody);
        // Handle the server response here
        print('Upload successful: $responseData');
      } else {
        print('Upload failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }
}
