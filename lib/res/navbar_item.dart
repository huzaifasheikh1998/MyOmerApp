import 'package:mvvm/view/exercise_view.dart';
import 'package:mvvm/view/home_view.dart';
import 'package:mvvm/view/journal_view.dart';
import 'package:mvvm/view/video_view.dart';

class NavbarItem {
  static List navbarItem = [
    HomeView(),
    JournalView(),
    ExerciseView(),
    VideoView(),
  ];
}
