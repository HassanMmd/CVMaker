import 'package:http_interceptor/http_interceptor.dart';

import 'authenticator.dart';

class ClientInterceptor implements InterceptorContract{

  Authenticator authenticator = Authenticator();
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async{
    var id = await authenticator.getIDToken();
    try {
      data.headers['Content-Type'] = 'application/json';
      data.headers['Authorization']= 'Bearer $id';
      print('token ID = $id');
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async{
    return data;
  }
}