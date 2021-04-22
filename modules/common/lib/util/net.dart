
import 'package:dio/dio.dart';

const REMOTE_HOST = "https://sibunda.amirmb.com";
const ENDPOINT_LOGIN = "$REMOTE_HOST/api/auth/login";
const ENDPOINT_REGISTER = "$REMOTE_HOST/api/auth/register";
const ENDPOINT_LOGOUT = "$REMOTE_HOST/api/auth/logout";

class SimpleNetResponse {
  final int? statusCode;
  final String? message;
  final data;

  const SimpleNetResponse(this.statusCode, this.message, [this.data]);
  SimpleNetResponse.from(Response response)
      : this(response.statusCode, response.statusMessage, response.data);

  @override
  String toString() {
    final superStr = super.toString();
    return "$superStr(statusCode=$statusCode, message=$message, data=$data)";
  }
}

class SibDio {
  SibDio._();
  static Options defaultOptions() => Options(
    followRedirects: false,
    validateStatus: (code) => true, //So that every response, even errors, is returned.
  );
}