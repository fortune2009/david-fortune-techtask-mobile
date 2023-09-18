import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static final String baseUrl = 'https://lb7u7svcm5.execute-api.ap-southeast-1.amazonaws.com/dev';

  static Future<List<dynamic>> getApi(String endpoint, {Map<String, dynamic> queryParams}) async {
    try {
      final uri = Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams);

      final response = await http.get(uri);

      // debugPrint("Check get data from URL ${response.body}");


      if (response.statusCode == 200) {
        final parsedData = json.decode(response.body);
        return parsedData;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  static Future<List<dynamic>> postApi(String endpoint, Map<String, String> body) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/$endpoint'), body: body);

      if (response.statusCode == 200) {
        final parsedData = json.decode(response.body);
        return parsedData;
      } else {
        throw Exception('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
