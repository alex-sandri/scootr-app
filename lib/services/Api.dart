import 'dart:convert';

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
    required ApiMethod method,
    required String path,
    Object? body,
  }) async {
    final Map<String, String> headers = {
      "Authorization": "Bearer ${AuthService.session?.id}",
      "Content-Type": "application/json",
    };

    late http.Response response;

    try
    {
      switch (method)
      {
        case ApiMethod.GET:
        {
          response = await http.get(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
          );

          break;
        }
        case ApiMethod.POST:
        {
          response = await http.post(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
            body: body,
          );

          break;
        }
        case ApiMethod.PATCH:
        {
          response = await http.patch(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
            body: body,
          );

          break;
        }
        case ApiMethod.PUT:
        {
          response = await http.put(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
            body: body,
          );

          break;
        }
        case ApiMethod.DELETE:
        {
          response = await http.delete(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
          );

          break;
        }
      }
    }
    catch (e)
    {
      print(e);
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
      result.errors = json["details"] ?? [];
    }
    else
    {
      switch (T)
      {
        case Session: result.data = Session.deserialize(json) as T; break;
      }
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
  T? data;
  List<ApiResponseError>? errors;

  ApiResponse({
    required this.status,
    required this.success,
    this.data,
    this.errors,
  });
}

class ApiResponseError {
  final String field;
  final String message;

  const ApiResponseError({
    required this.field,
    required this.message,
  });
}
