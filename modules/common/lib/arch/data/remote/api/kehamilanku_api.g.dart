// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kehamilanku_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _KehamilankuApi implements KehamilankuApi {
  _KehamilankuApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://sibunda.amirmb.com/api/kehamilanku';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PregnancyHomeResponse> getHomeData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PregnancyHomeResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/overview',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PregnancyHomeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PregnancyCreateCheckResponse> sendPregnancyCheckForm(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PregnancyCreateCheckResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/create-weekly-report',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PregnancyCreateCheckResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PregnancyCheckBody> getPregnancyCheckForm(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PregnancyCheckBody>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/show-weekly-report',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PregnancyCheckBody.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
