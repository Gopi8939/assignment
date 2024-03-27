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

  static Future<http.StreamedResponse> teacherRegister(
    String username,
    String password,
    String mobile,
    String name,
    String cOLLEGE,
    String department,
    String achievements,
    String qualification,
    String experience,
  ) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrl}register/teacher'));
      request.fields.addAll({
        "username": username,
        "password": password,
        "mobile": mobile,
        "name": name,
        'college': cOLLEGE,
        'department': department,
        'field': "",
        'qualifications': qualification,
        'post': "",
        'achievements': achievements,
        'experience': experience,
        'profile_pic': ""
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }

  static Future<http.StreamedResponse> organizationRegister(
    String username,
    String password,
    String mobile,
    String cOLLEGE,
    String city,
    String orgEmail,
    String profilepic,
  ) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${baseUrl}register/organization'));
      request.fields.addAll({
        "username": username,
        "password": password,
        "mobile": mobile,
        'college': cOLLEGE,
        'city': city,
        'org_email': orgEmail,
        'profile_pic': profilepic
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }

  static Future<http.StreamedResponse> getRecommendedUser() async {
    try {
      var headers = {'Accept': 'application/ecmascript'};
      var request = http.MultipartRequest(
          'GET', Uri.parse('${baseUrl}user/recommendation?userId=4'));
      request.fields.addAll({'userId': '4'});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to Get Recommended user $e');
    }
  }

  static Future<http.StreamedResponse> sendFllowRequest(
      int userId, int followerId) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${baseUrl}user/follow'));
      request.fields.addAll({
        'followerId': userId.toString(),
        'followingId': followerId.toString(),
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to sign in: $e');
    }
  }
}
