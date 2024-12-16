import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/model/video_model/video_model.dart';
import 'package:mvvm/res/app_url.dart';

// List<VideoModel> videoApiList = [];
// Future fetchVideoList() async {
//   final response =
//       await https.get(Uri.parse("http://zelektra.com/omer/api/get_videos.php"));
//   if (response.statusCode == 200) {
//     var data = jsonDecode(response.body);
//     var dataResponse = data["response"];
//     print(dataResponse);
//     for (Map i in dataResponse) {
//       videoApiList.add(VideoModel.fromJson(i));
//     }
//   }
//   return videoApiList;
// }

class VideoRepo {
  final BaseApiServices _apiServices = NetworkApiService();
  List<VideoModel> videoList = [];
  Future<List<VideoModel>> fetchVideoList() async {
    try {
      dynamic data = await _apiServices.getGetApiResponse(AppUrl.videoUrl);
      videoList.clear();
      dynamic response = data["response"];
      for (var item in response) {
        videoList.add(VideoModel.fromJson(item));
      }
      return videoList;
    } catch (e) {
      throw e;
    }
  }
}
