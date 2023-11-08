import 'dart:convert';
import 'dart:io';

import 'package:flutter_webapi_first_course/repositories/local_shared_repository.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  //TODO: Modularizar o endpoint
  static const String url = "http://192.168.1.6:3000/";
  // LocalSharedRepository _localSharedRepository = LocalSharedRepository();

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(Uri.parse("${url}login"), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode != 200) {
      String content = json.decode(response.body);
      switch (content) {
        case 'Cannot find user':
          throw UserNotFindException();
      }
      throw HttpException(response.body);
    }

    saveUserInfos(response.body);

    return true;
  }

  Future<bool> register({required String email, required String password}) async {
    http.Response response =
        await client.post(Uri.parse("${url}register"), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode != 201) {
      throw HttpException(response.body);
    }

    saveUserInfos(response.body);
    return true;
  }

  saveUserInfos(String body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> map = json.decode(body);
    String token = map["accessToken"];
    String email = map["user"]["email"];
    int id = map["user"]["id"];
    prefs.setString("accessToken", token);
    prefs.setString("email", email);
    prefs.setInt("id", id);
  }
}

class UserNotFindException implements Exception {}
