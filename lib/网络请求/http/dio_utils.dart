import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82/http/http_error.dart';
import 'package:flutter_demo/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82/http/response_model.dart';
import 'api.dart';

const int _connectTimeout = 15000; // 15秒
const int _receiveTimeout = 15000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

enum DioMethod {
  get,
  post,
}

class DioManager {
  static final DioManager _shared = DioManager._internal();

  factory DioManager() => _shared;
  Dio _dio;

  DioManager._internal() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: Api.baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
      );
      _dio = Dio(options);
      // 请求与响应拦截器
      _dio.interceptors.add(OnRequestInterceptors());
      // 异常拦截器
      _dio.interceptors.add(OnErrorInterceptors());
    }
  }

  // get请求
  Future get({@required String url, Map params}) async {
    return await request(url, method: DioMethod.get, params: params);
  }

  Future post({@required String url, Map params}) async {
    return await request(url, method: DioMethod.post, params: params);
  }

  Future request(
    String url, {
    DioMethod method = DioMethod.get,
    Map params,
  }) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
    };
    try {
      Response response = await _dio.request(
        url,
        data: params,
        options: Options(
          method: methodValues[method],
        ),
      );

      // JSON 序列化, Response<dynamic> 转 Map<String, dynamic>
      String jsonStr = json.encode(response.data);
      Map<String, dynamic> map = json.decode(jsonStr);

      var responseModel = ResponseModel.fromJson(map);
      return responseModel.data;
    } on DioError catch (e) {
      return null;
    }
  }
}

// Dio 请求与响应拦截器
class OnRequestInterceptors extends InterceptorsWrapper {
  // 请求拦截
  @override
  Future onRequest(RequestOptions options) {
    if (Api.inProduction == false) {
      print("请求baseUrl：${options.baseUrl}");
      print("请求url：${options.path}");
      print('请求头: ${options.headers.toString()}');
      if (options.data != null) {
        print('请求参数: ${options.data.toString()}');
      }
      return super.onRequest(options);
    }
  }

  // 响应拦截
  @override
  Future onResponse(Response response) {
    Response res = response;
    if (response != null) {
      if (Api.inProduction == false) {
        print('响应: ${response.toString()}');
      }
    }

    if (response.statusCode == 200) {
      String errCode = response.data['MsgCode'];
      if (errCode == HttpError.SUCCESS) {
        res = response;
      }
    }

    return super.onResponse(res);
  }
}

// Dio OnError 拦截器
class OnErrorInterceptors extends InterceptorsWrapper {
  @override
  Future onError(DioError err) {
    if (Api.inProduction == false) {
      print('请求异常: ${err.toString()}');
      print('请求异常信息: ${err.response?.toString() ?? ""}');
    }
    HttpError.dioError(err);
    return super.onError(err);
  }
}

// 自定义Header
Map<String, dynamic> httpHeaders = {};
