import 'package:cvmaker/authenticator.dart';
import 'package:cvmaker/clientInterceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

abstract class Repository {
  Client client = InterceptedClient.build(interceptors: [
    ClientInterceptor(),
  ]);


}