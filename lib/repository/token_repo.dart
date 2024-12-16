import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class TokenRepo {
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> tokenApi(dynamic body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.tokenUrl, body);
      print(data);
      return data;
    } catch (e) {
      throw e;
    }
  }
}
