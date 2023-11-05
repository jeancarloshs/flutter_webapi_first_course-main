class RequestData {
  final String baseUrl;
  final Map<String, String> headers;
  final String body;

  RequestData({
    required this.baseUrl,
    required this.headers,
    required this.body,
  });
}

class ResponseData {
  final String url;
  final Map<String, String> headers;
  final String body;

  ResponseData({
    required this.url,
    required this.headers,
    required this.body,
  });
}
