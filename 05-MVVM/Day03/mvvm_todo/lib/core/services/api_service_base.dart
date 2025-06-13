abstract class ApiServiceBase {
  Future<dynamic> getData(String url, {Map<String, String>? headers});
}
