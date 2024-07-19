import 'dart:convert';
import 'package:http/http.dart' as http;

class MHttpHelper {
  static const String _baseUrl = 'https://api-base-url.com';

  //------------Helper method to make a get request-----//
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  //----------------Helper method to make Post-----------//
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final respose = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return _handleResponse(respose);
  }

  //--------------------Helper method for Put------------//
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final respose = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: json.encode(data));
    return _handleResponse(respose);
  }

  //-------------------Helper Method for Delete--------//
  static Future<Map<String, dynamic>> delete(
      String endpoint, dynamic data) async {
    final respose = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(respose);
  }

  //-----------------------Handle the http response---------//
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to Load data: ${response.statusCode}');
    }
  }
}
