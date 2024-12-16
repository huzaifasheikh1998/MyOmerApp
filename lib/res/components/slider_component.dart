import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/view_model/exercise_view_model.dart';
import 'package:provider/provider.dart';

class SliderComponent extends StatelessWidget {
  String title;
  int initialValue;
  int value;
  final viewModel;
  SliderComponent(
      {super.key,
      required this.title,
      required this.initialValue,
      required this.value,
      required this.viewModel});

  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    final exerciseViewModel =
        Provider.of<ExerciseViewModel>(context, listen: false);
    return GestureDetector(
      onTap: () {
        viewModel.setIndex(initialValue);
        // Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => test1()));
      },
      child: Container(
        padding: EdgeInsets.all(sized.width(0.03)),
        decoration: BoxDecoration(
          color: initialValue == value
              ? AppColors.secondaryColor
              : AppColors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Content(
          data: title,
          size: sized.width(0.041),
          color:
              initialValue == value ? AppColors.white : AppColors.primaryColor,
        ),
      ),
    );
  }
}
