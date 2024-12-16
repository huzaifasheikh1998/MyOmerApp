import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/model/aftb_notes_model/aftb_notes_model.dart';
import 'package:mvvm/model/diary_note_mpdel/diary_note_model.dart';
import 'package:mvvm/model/reminder_model/reminder_model.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/journal_view.dart';

import '../repository/journal_repo.dart';

class JournalViewModel with ChangeNotifier {
  final journalRepo = JournalRepo();

  bool _loading = false;
  bool get loading => _loading;

  int _index = 0;
  get index => _index;

  bool _notification = false;
  bool get notification => _notification;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  reload() {
    Timer(Duration(seconds: 2), () {
      print("<<<<<<<<<<<<<<<reload>>>>>>>>>>>>>>>");
      notifyListeners();
    });
  }

  // List _notiList = [];
  // get notiList => _notiList;

  setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  Future getAllEvent(body) async {
    print("<<<<<<<<<<<<<<<<<<<<<<<<get all event>>>>>>>>>>>>>>>>>>>>>>>>");
    // decisionData =
    await journalRepo.fetchDecisionList(body).then((value) {
      selectedEvent = {};
      for (int i = 0; i < decisionList.length; i++) {
        final eventDate = Utils.dateFormatter(decisionList[i].date);
        selectedEvent[eventDate] = [
          Reminder(title: decisionList[i].comment.toString())
        ];
        // print(selectedEvent);
      }
      reload();
    });
    // print(decisionList);
    // selectedEvent = {};
    // for (int i = 0; i < decisionList.length; i++) {
    //   // print(decisionList[i]);
    //   // final d = DateTime.parse(decisionList[i].date.toString());
    //   // final e = DateTime.parse("${d}Z");
    //   final eventDate = Utils.dateFormatter(decisionList[i].date);

    //   selectedEvent[eventDate] = [
    //     Reminder(title: decisionList[i].comment.toString())
    //   ];
    //   print(selectedEvent);
    //   // setState(() {

    //   // });
    // }
    // reload();
  }

  Future getAllDiary(body) async {
    await journalRepo.fetchDiaryList(body).then((value) {
      diaryNotes = {};
      for (int i = 0; i < diaryList.length; i++) {
        final diaryDate = Utils.dateFormatter(diaryList[i].date);
        diaryNotes[diaryDate] = [
          DiaryNoteModel(title: diaryList[i].comment.toString()),
        ];
        // print(diaryNotes);
      }
      reload();
    });
  }

  Future getAllAftb(body) async {
    await journalRepo.fetchAftbList(body).then((value) {
      aftbNotes = {};
      for (int i = 0; i < AftbList.length; i++) {
        final eventDate = Utils.dateFormatter(AftbList[i].date);
        aftbNotes[eventDate] = [
          AftbNotesModel(
              title: AftbList[i].incident.toString(),
              content: AftbList[i].outcome.toString())
        ];
        // print(aftbNotes);
      }
      reload();
    });
  }

  // Future<void> setDairy(dynamic body, TextEditingController controller) async {
  //   setLoading(true);
  //   journalRepo.setDairy(body).then((value) {
  //     final status = value.first["status"].toString();
  //     if (status == "1" || status == "2") {
  //       Utils.toastMessage("Added Successfully");
  //       controller.clear();
  //       setLoading(false);
  //     } else {
  //       Utils.toastMessage("Failed");
  //       setLoading(false);
  //     }
  //   }).onError((error, stackTrace) {
  //     Utils.toastMessage(error.toString());
  //   });
  // }
  Future<void> setDiary(dynamic body, TextEditingController controller,
      BuildContext context) async {
    setLoading(true);
    journalRepo.setDairy(body).then((value) async {
      final status = value.first["status"].toString();
      if (status == "1" || status == "2") {
        Utils.toastMessage("Added Successfully");
        controller.clear();

        Timer(Duration(milliseconds: 1300), () async {
          setLoading(false);
          Navigator.pop(context);
          await getAllDiary(basicBody);
        });
      } else {
        Utils.toastMessage("Failed");
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }

  Future<void> setDecision(dynamic body, TextEditingController controller,
      BuildContext context) async {
    setLoading(true);
    journalRepo.setDecision(body).then((value) async {
      final status = value.first["status"].toString();
      if (status == "1" || status == "2") {
        Utils.toastMessage("Added Successfully");
        controller.clear();

        Timer(Duration(milliseconds: 1300), () async {
          setLoading(false);
          Navigator.pop(context);
          await getAllEvent(basicBody);
        });
      } else {
        Utils.toastMessage("Failed");
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }

  Future<void> setAftb(
    BuildContext context,
    dynamic body,
    TextEditingController controller,
    TextEditingController controller2,
  ) async {
    setLoading(true);
    journalRepo.setAftb(body).then((value) async {
      final status = value.first["status"].toString();
      if (status == "1" || status == "2") {
        Utils.toastMessage("Added Successfully");
        controller.clear();
        controller2.clear();
        Timer(Duration(milliseconds: 1300), () async {
          setLoading(false);
          Navigator.pop(context);
          await getAllAftb(basicBody);
        });
      } else {
        Utils.toastMessage("Failed");
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
    });
  }

  setNotification(bool status) {
    // print(status);
    _notification = status;
    notifyListeners();
  }

  initializeNotification() {
    _notification = false;
    print("initalize notification");
    notifyListeners();
  }
}
