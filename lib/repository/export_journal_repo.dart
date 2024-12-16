import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/res/app_url.dart';

class ExportJournalRepo {
  final BaseApiServices _apiServices = NetworkApiService();
  Future fetchExportJounal(body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.exportUrl, body);
      if (data["status"].toString() == "1") {
        dynamic response = data["response"];
        print(response["url"]);
        return response["url"].toString();
      } else {
        return false;
      }
    } catch (e) {
      throw e;
    }
  }
}
