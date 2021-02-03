import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tomato_owl/presenter/widgets/text.dart';
import 'package:tomato_owl/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tomato_owl/services/app_localizations.dart';

class NavigationWidget extends StatelessWidget {
  final String text;

  NavigationWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50.w,
          ),
          Container(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset("assets/images/svg/ic_payment_arrow.svg"),
              iconSize: 20,
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              splashRadius: 20,
            ),
          ),
          SizedBox(
            width: 50.w,
          ),
          Container(
            child: TitleText(
              AppLocalizations.of(context).translate(text),
              textColor: AppColors.BLACK,
              fontWeight: FontWeight.w700,
              size: 41.07,
            ),
          )
        ],
      ),
    );
  }
}
