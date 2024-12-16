import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class Loader extends StatelessWidget {
  final Color? loadingColor;
  const Loader({Key? key, this.loadingColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: CircularProgressIndicator(
            color: loadingColor != null
                ? AppColors.thirdColor
                : AppColors.primaryColor,
            strokeWidth: 3,
          ),
        ),
      ],
    );
  }
}
