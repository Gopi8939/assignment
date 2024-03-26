import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://api.aenow.online/api/';

  static Future<http.StreamedResponse> signIn(
      String email, String password) async {
    try {
      log("Indide Signin${email}, ${password}");

      var request =
          http.MultipartRequest('POST', Uri.parse('${baseUrl}auth/login'));
      request.fields.addAll({
        'username': email,
        'password': password,
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to sign in: $e');
    }
  }

  static Future<http.StreamedResponse> studentRegister(
    String username,
    String password,
    String name,
    String mobileNumber,
    String cOLLEGE,
    String dEGREE,
    String cORESKILLS,
    String hOBBIES,
    String achievements,
  ) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrl}register/student'));
      request.fields.addAll({
        "username": username,
        "password": password,
        "mobile": mobileNumber,
        "name": name,
        "college": cOLLEGE,
        "degree": dEGREE,
        "core_skills": cORESKILLS,
        "hobbies": hOBBIES,
        "achievements": achievements,
        "year": "",
        "interests": "",
        "language": "",
        "profile_pic": "",
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }
}
