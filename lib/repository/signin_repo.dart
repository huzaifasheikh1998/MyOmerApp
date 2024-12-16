import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class SignInRepo {
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> signApi(dynamic body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.signInUrl, body);
      return data;
    } catch (e) {
      throw e;
    }
  }
}
