import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mvvm_todo/core/services/api_service_base.dart';

class ApiService extends ApiServiceBase {
  final Dio dio = Dio();

  @override
  Future<dynamic> getData(String url, {Map<String, String>? headers}) async {
    try {
      final Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        //log('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      //log('API call failed: $e');
      return null;
    }
  }
}
