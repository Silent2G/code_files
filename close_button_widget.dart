import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomato_owl/resources/app_colors.dart';

class CloseButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        padding: EdgeInsets.zero,
        splashRadius: 23,
        constraints: BoxConstraints(),
        iconSize: 18,
        icon: SvgPicture.asset(
          "assets/images/svg/ic_close.svg",
          color: AppColors.SPLASH,
        ),
      ),
    );
  }
}