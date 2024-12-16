import 'package:flutter/material.dart';
import 'package:mvvm/repository/export_journal_repo.dart';
import 'package:mvvm/utils/doc_download.dart';
import 'package:mvvm/utils/utils.dart';

class TabViewModel with ChangeNotifier {
  final exportJournalRepo = ExportJournalRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> fetchJournal(dynamic body) async {
    setLoading(true);
    Utils.toastMessage("loading");
    exportJournalRepo.fetchExportJounal(body).then((value) {
      print("<<<<<<<<<<<<<<<<<<<<<value<$value>>>>>>>>>>>>>>>>>>>>>>");
      if (value == false) {
        setLoading(false);
        Utils.toastMessage("Failed to export journal");
      } else {
        DocDownload().doDownloadFile(value);
        // .then((value) {
        //   setLoading(false);
        // });
      }
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      setLoading(false);
    });
  }
}
