import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {

  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    logger.d();
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
      print(response.toString());
      return response;
  }
  
  @override
  Future<bool> shouldInterceptRequest() {
    // TODO: implement shouldInterceptRequest
    throw UnimplementedError();
  }
  
  @override
  Future<bool> shouldInterceptResponse() {
    // TODO: implement shouldInterceptResponse
    throw UnimplementedError();
  }

}