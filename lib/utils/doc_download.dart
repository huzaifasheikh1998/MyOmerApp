import 'dart:async';
import 'dart:io' as io;
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';

class DocDownload {
  ///open file
  openFileFunc(String filePath) {
    Utils.toastMessage("Opening");
    print(filePath);
    Timer(Duration(milliseconds: 1000), () {
      OpenFilex.open(filePath);
    });

    print("open file");
  }

  /// Get storage premission request from user
  Future<bool> getStoragePremission() async {
    return await Permission.storage.request().isGranted;
  }

  /// Get user's phone download directory path
  Future<String> getDownloadFolderPath() async {
    return await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
  }

  /// Download image and return downloaded image path
  Future downloadFile(String downloadDirectory, String fileUrl) async {
    Dio dio = Dio();
    final fileName = fileUrl.split("/").last;
    print(
        "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<$fileName>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    var downloadedImagePath = '$downloadDirectory/$fileName';
    final bool fileExist = await io.File(downloadedImagePath).exists();
    if (!fileExist) {
      try {
        bool downloadToast = true;
        await dio.download(fileUrl, downloadedImagePath,
            onReceiveProgress: (rec, total) {
          if (downloadToast) {
            Utils.toastMessage("Downloading");
            // downloadProvider.updateProgress(0);
            downloadToast = false;
          }
          // if (total == 1) {
          //   print("object");
          //   Utils.toastMessage("Downloading...");
          // }

          print("REC: $rec , TOTAL: $total");
          // setState(() {
          // downloading = true;
          // downloadProgress = (rec / total);
          // downloadProvider.updateProgress(downloadProgress);
          // .toStringAsFixed(0) + "%";
          // print(downloadProgress);
          // });
        });
      } catch (e) {
        print(e);
      }
    }

    // Delay to show that the download is complete
    await Future.delayed(const Duration(seconds: 1));

    return downloadedImagePath;
  }

  /// Do download by user's click
  Future<void> doDownloadFile(String fileUrl) async {
    if (await getStoragePremission()) {
      String downloadDirectory = await getDownloadFolderPath();
      await downloadFile(downloadDirectory, fileUrl).then((filePath) {
        openFileFunc(filePath);
      });
    }
  }
}
