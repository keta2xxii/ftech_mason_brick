import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/my_device_info.dart';
import 'app_keys.dart';

class DioProvider {
  static Future<dio.Dio> instance({required int timeOut}) async {
    final myDio = dio.Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String deviceId = await MyDeviceInfo().deviceID();
    final token = prefs.getString(AppKeys.keyToken);
    if (token != null) {
      myDio.options.headers = {
        "Accept": "application/json",
        "content-type": "application/json",
        "X-API-TOKEN": token,
        "User-Agent": "${Platform.isAndroid ? "iOS" : "Android"}_$deviceId",
      };
    } else {
      myDio.options.headers = {
        "Accept": "application/json",
        "content-type": "application/json",
        "User-Agent": "${Platform.isAndroid ? "iOS" : "Android"}_$deviceId"
      };
    }
    myDio.options.sendTimeout = timeOut;
    myDio.options.connectTimeout = timeOut;
    myDio.options.receiveTimeout = timeOut;
    myDio.interceptors.add(HttpLogInterceptor());
    return myDio;
  }
}

class HttpLogInterceptor extends dio.InterceptorsWrapper {
  @override
  void onRequest(
      dio.RequestOptions options, dio.RequestInterceptorHandler handler) {
    log("==================================================================================================================\n"
        "onRequest: ${options.uri}\n"
        "data=${options.data}\n"
        "method=${options.method}\n"
        "headers=${options.headers}\n"
        "queryParameters=${options.queryParameters}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
      dio.Response response, dio.ResponseInterceptorHandler handler) {
    log("onResponse: url:${response.requestOptions.path} : ${response.data}\n"
        "==================================================================================================================");
    super.onResponse(response, handler);
  }

  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) {
    log("onError: ${err.requestOptions.path} : $err\n"
        "Response: ${err.requestOptions.path} : ${err.response}\n"
        "==================================================================================================================");
    super.onError(err, handler);
  }
}
