import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/chart_model/chart_model.dart';
import 'package:mvvm/res/app_url.dart';

class ChartRepo {
  final BaseApiServices _apiServices = NetworkApiService();
  List<ChartModel> chartList = [];
  Future<List<ChartModel>> fetchChartList(body) async {
    try {
      dynamic data =
          await _apiServices.getPostApiResponse(AppUrl.chartUrl, body);
      chartList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        chartList.add(ChartModel.fromJson(item));
      }
      return chartList;
    } catch (e) {
      throw e;
    }
  }
}
