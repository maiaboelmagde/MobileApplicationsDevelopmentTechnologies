import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<dynamic> getData(String url, {Map<String, String>? headers}) async {
    try {
      final Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        print('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('API call failed: $e');
      return null;
    }
  }
}
