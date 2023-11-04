import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import '../models/journal.dart';

class JournalService {
  static const String url = "http://192.168.1.5:3000/";
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    String jsonJornal = json.encode(journal.toMap());
    http.Response response = await client.post(Uri.parse(getUrl()),
        headers: {'Content-type': 'application/json'}, body: jsonJornal);
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<String> get() async {
    http.Response response = await http.get(Uri.parse(getUrl()));
    debugPrint("response.body ${response.body}");
    return response.body;
  }
}
