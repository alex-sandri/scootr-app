import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:scootr/config/Config.dart';
import 'package:scootr/models/PaymentMethod.dart';
import 'package:scootr/models/Ride.dart';
import 'package:scootr/models/Session.dart';
import 'package:scootr/models/Subscription.dart';
import 'package:scootr/models/Transaction.dart';
import 'package:scootr/models/User.dart';
import 'package:scootr/models/Wallet.dart';

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
    T Function(dynamic json)? deserialize,
  }) async {
    final Map<String, String> headers = {
      "Authorization": "Bearer ${Hive.box("auth").get("sessionId")}",
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
            body: jsonEncode(body),
          );

          break;
        }
        case ApiMethod.PATCH:
        {
          response = await http.patch(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
            body: jsonEncode(body),
          );

          break;
        }
        case ApiMethod.PUT:
        {
          response = await http.put(
            Uri.parse("${Config.API_ENDPOINT}$path"),
            headers: headers,
            body: jsonEncode(body),
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
    else if (deserialize != null)
    {
      result.data = deserialize(json);
    }

    return result;
  }

  /* ------------------
  -- PAYMENT METHODS --
  ------------------ */

  static Future<ApiResponse<List<PaymentMethod>>> listPaymentMethodsForWallet(Wallet wallet) async {
    return ApiService.send<List<PaymentMethod>>(
      method: ApiMethod.GET,
      path: "/wallets/${wallet.id}/payment-methods",
      deserialize: (_) {
        return (_ as List<dynamic>)
          .map((_) => PaymentMethod.deserialize(Map<String, dynamic>.from(_)))
          .toList();
      },
    );
  }

  static Future<ApiResponse<PaymentMethod>> setDefaultPaymentMethodForWallet({
    required PaymentMethod paymentMethod,
    required Wallet wallet,
  }) async {
    return ApiService.send<PaymentMethod>(
      method: ApiMethod.PUT,
      path: "/wallets/${wallet.id}/payment-methods/default",
      body: {
        "id": paymentMethod.id,
      },
      deserialize: (_) => PaymentMethod.deserialize(Map<String, dynamic>.from(_)),
    );
  }

  /* --------
  -- RIDES --
  -------- */

  static Future<ApiResponse<List<Ride>>> listRidesForUser(User user) async {
    return ApiService.send<List<Ride>>(
      method: ApiMethod.GET,
      path: "/users/${user.id}/rides",
      deserialize: (_) {
        return (_ as List<dynamic>)
          .map((_) => Ride.deserialize(Map<String, dynamic>.from(_)))
          .toList();
      },
    );
  }

  /* -----------
  -- SESSIONS --
  ----------- */

  static Future<ApiResponse<Session>> retrieveSession(String id) async {
    return ApiService.send<Session>(
      method: ApiMethod.GET,
      path: "/sessions/$id",
      deserialize: (_) => Session.deserialize(_ as Map<String, dynamic>),
    );
  }

  static Future<ApiResponse<void>> deleteSession(String id) async {
    return ApiService.send<void>(
      method: ApiMethod.DELETE,
      path: "/sessions/$id",
    );
  }

  /* ----------------
  -- SUBSCRIPTIONS --
  ---------------- */

  static Future<ApiResponse<List<Subscription>>> listSubscriptionsForWallet(Wallet wallet) async {
    return ApiService.send<List<Subscription>>(
      method: ApiMethod.GET,
      path: "/wallets/${wallet.id}/subscriptions",
      deserialize: (_) {
        return (_ as List<dynamic>)
          .map((_) => Subscription.deserialize(Map<String, dynamic>.from(_)))
          .toList();
      },
    );
  }

  /* ---------------
  -- TRANSACTIONS --
  --------------- */

  static Future<ApiResponse<List<Transaction>>> listTransactionsForWallet(Wallet wallet) async {
    return ApiService.send<List<Transaction>>(
      method: ApiMethod.GET,
      path: "/wallets/${wallet.id}/transactions",
      deserialize: (_) {
        return (_ as List<dynamic>)
          .map((_) => Transaction.deserialize(Map<String, dynamic>.from(_)))
          .toList();
      },
    );
  }

  /* ----------
  -- WALLETS --
  ---------- */

  static Future<ApiResponse<List<Wallet>>> listWalletsForUser(User user) async {
    return ApiService.send<List<Wallet>>(
      method: ApiMethod.GET,
      path: "/users/${user.id}/wallets",
      deserialize: (_) {
        return (_ as List<dynamic>)
          .map((_) => Wallet.deserialize(Map<String, dynamic>.from(_)))
          .toList();
      },
    );
  }

  static Future<ApiResponse<Wallet>> updateWallet(Wallet wallet, {
    String? name,
  }) async {
    return ApiService.send<Wallet>(
      method: ApiMethod.PATCH,
      path: "/wallets/${wallet.id}",
      body: {
        "name": name,
      },
      deserialize: (_) => Wallet.deserialize(Map<String, dynamic>.from(_)),
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
