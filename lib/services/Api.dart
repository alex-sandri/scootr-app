import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/services/Auth.dart';

enum ApiMethod {
  GET,
  POST,
  PATCH,
  PUT,
  DELETE,
}

class ApiService {
  static Future<ApiResponse<T>> send<T>({
    @required ApiMethod method,
    @required String path,
    Object body,
  }) async {
    final Map<String, String> headers = {
      "Authorization": "Bearer ${AuthService.session?.id}",
      "Content-Type": "application/json",
    };

    http.Response response;

    if (method == ApiMethod.GET)
    {
      response = await http.get(
        Uri.parse("${Config.API_ENDPOINT}$path"),
        headers: headers,
      );
    }

    final ApiResponse<T> result = ApiResponse<T>(
      status: response.statusCode,
      success: response.statusCode >= 200 && response.statusCode < 300,
    );

    // No Content
    if (result.status == 204)
    {
      return result;
    }

    final json = jsonDecode(response.body);

    if (!result.success)
    {
      result.errors = json.details;
    }
    else
    {
      result.data = json;
    }

    return result;
  }

  static Future<ApiResponse<Session>> retrieveSession(String id) async {
    return ApiService.send<Session>(
      method: ApiMethod.GET,
      path: "/sessions/$id",
    );
  }
}

class ApiResponse<T> {
  final int status;
  final bool success;
  T data;
  List<ApiResponseError> errors;

  ApiResponse({
    @required this.status,
    @required this.success,
    this.data,
    this.errors,
  });
}

class ApiResponseError {
  final String field;
  final String message;

  const ApiResponseError({
    @required this.field,
    @required this.message,
  });
}
