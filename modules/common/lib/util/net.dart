
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
}