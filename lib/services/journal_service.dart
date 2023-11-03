import 'package:flutter/material.dart';
import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class JournalService {
  static const String url = "http://192.168.1.7:3000/";
  static const String resource = "learnhttp";

  http.Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  register(String content) {
    debugPrint('URL $url$resource');
    http.post(Uri.parse(getUrl()), body: {
      "content": content,
    });
  }

  Future<String> get() async {
    http.Response response = await http.get(Uri.parse(getUrl()));
    debugPrint("response.body ${response.body}");
    return response.body;
  }
}
