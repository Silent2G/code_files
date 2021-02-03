import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:tomato_owl/presenter/widgets/user_input.dart';
import 'package:tomato_owl/presenter/widgets/profile_toolbar.dart';
import 'package:tomato_owl/presenter/widgets/scroll_wrap.dart';
import 'package:tomato_owl/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataScreen extends StatefulWidget {
  @override
  State createState() {
    return UserDataScreenState();
  }
}

class UserDataScreenState extends State<UserDataScreen> {
  MaskTextInputFormatter maskFormatterPhone = new MaskTextInputFormatter(
      mask: '+### ## ###-##-##', filter: {"#": RegExp(r'[0-9]')});

  MaskTextInputFormatter maskFormatterBirthday = new MaskTextInputFormatter(
      mask: '##.##.##', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.WHITE,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.WHITE,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: ProfileToolbar(),
          ),
          body: ScrollWrap(
            child: Container(
              padding: EdgeInsets.only(left: 50.w, right: 35.w),
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Container(
                      child: UserInput(
                    label: "surname_name",
                  )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                      child: UserInput(
                    label: "phone",
                    formatter: maskFormatterPhone,
                  )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                      child: UserInput(
                    label: "birthday",
                    formatter: maskFormatterBirthday,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
