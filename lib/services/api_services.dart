import 'package:dio/dio.dart';
import 'package:task/constants/apis.dart';

class ApiServices {
  /*<========= Get Data list ============>*/
  Future<Response> getData(int page) async {
    return Dio().get(Apis.BASE_URL,
        options: Options(headers: {
          'Accept': "application/json",
        }, validateStatus: (_) => true));
  }
}
