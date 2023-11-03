// ignore_for_file: unnecessary_cast

import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';
class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (request is Request) {
      final requestData = request as Request;
      logger.v("Requisição para ${requestData.url}\nCabeçalhos: ${requestData.headers}\nCorpo: ${requestData.body}");
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    if (response is Response) {
      // Se o tipo de resposta for Response (do pacote http), você pode acessar a propriedade body
      final responseData = response as Response;
      if (responseData.statusCode ~/ 100 == 2) {
        logger.i("Resposta de ${responseData.request}\nStatus da Resposta: ${responseData.statusCode}\nCabeçalhos: ${responseData.headers}\nCorpo: ${responseData.body}");
      } else {
        logger.e("Resposta de ${responseData.request}\nStatus da Resposta: ${responseData.statusCode}\nCabeçalhos: ${responseData.headers}\nCorpo: ${responseData.body}");
      }
    } else {
      // Lógica para outros tipos de resposta, se necessário
      logger.w("Tipo de resposta desconhecido: ${response.runtimeType}");
    }
    
    return response;
  }
  
  @override
  Future<bool> shouldInterceptRequest() async {
    // Retorne true para interceptar todas as solicitações
    return true;
  }
  
  @override
  Future<bool> shouldInterceptResponse() async {
    // TODO: implement shouldInterceptResponse
    // throw UnimplementedError();
    return true;
  }
}
