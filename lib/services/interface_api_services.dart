abstract class IApiServices {
  Future<List<dynamic>> getApi(String endpoint, {Map<String, String> queryParams});
}
