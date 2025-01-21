import 'package:dio/dio.dart';

class DioErrorHandler {
  /// Parses Dio exceptions and returns a readable error message.
  static String handleError(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout. Please try again later.";
      case DioExceptionType.sendTimeout:
        return "Send timeout. Please check your connection.";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout. Please check your connection.";
      case DioExceptionType.badResponse:
      // Handle non-2xx responses
        return _handleResponseError(exception.response);
      case DioExceptionType.cancel:
        return "Request cancelled. Please try again.";
      case DioExceptionType.connectionError:
        return "Connection error. Please check your internet connection.";
      case DioExceptionType.unknown:
        return "An unexpected error occurred. Please try again.";
      default:
        return "Something went wrong. Please try again.";
    }
  }

  /// Handles errors based on response status codes.
  static String _handleResponseError(Response? response) {
    if (response == null) {
      return "An unexpected server error occurred.";
    }

    switch (response.statusCode) {
      case 400:
        return response.data["message"];
      case 401:
        return "Unauthorized access. Please login again.";
      case 403:
        return "Forbidden. You don't have permission to access this resource.";
      case 404:
        return "Not found. The requested resource doesn't exist.";
      case 500:
        return "Internal server error. Please try again later.";
      case 503:
        return "Service unavailable. Please try again later.";
      default:
        return "Unexpected status code: ${response.statusCode}.";
    }
  }
}
