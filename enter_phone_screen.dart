import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tomato_owl/presenter/screens/enter_phone/widget/mask_widget.dart';
import 'package:tomato_owl/presenter/screens/enter_sms/view/enter_sms_screen.dart';
import 'package:tomato_owl/presenter/screens/user_data/view/user_data_screen.dart';
import 'package:tomato_owl/presenter/widgets/button.dart';
import 'package:tomato_owl/presenter/widgets/close_button_widget.dart';
import 'package:tomato_owl/presenter/widgets/scroll_wrap.dart';
import 'package:tomato_owl/presenter/widgets/text.dart';
import 'package:tomato_owl/providers/approve_phone_notifier.dart';
import 'package:tomato_owl/providers/phone_number_notifier.dart';
import 'package:tomato_owl/providers/register_phone_notifier.dart';
import 'package:tomato_owl/resources/app_colors.dart';
import 'package:tomato_owl/services/app_localizations.dart';

class EnterPhoneScreen extends StatefulWidget {
  @override
  State createState() {
    return EnterPhoneScreenState();
  }
}

class EnterPhoneScreenState extends State<EnterPhoneScreen> {
  RegisterPhoneNotifier registerPhoneNotifier;

  @override
  void initState() {
    registerPhoneNotifier =
        Provider.of<RegisterPhoneNotifier>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.WHITE,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.WHITE,
            body: ScrollWrap(
                child: Container(
                    width: width,
                    child: MultiProvider(
                      providers: [
                        ChangeNotifierProvider(
                            create: (context) => PhoneNumberNotifier())
                      ],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 30.w, top: 30.h),
                            child: CloseButtonWidget(),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Container(
                              child: Center(
                            child: TitleText(
                              AppLocalizations.of(context)
                                  .translate("enter_phone_number"),
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.BLACK,
                              size: 45,
                            ),
                          )),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            child: Center(
                              child: TitleText(
                                AppLocalizations.of(context)
                                    .translate("you_can_fast"),
                                fontWeight: FontWeight.w400,
                                textColor: AppColors.BLACK,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 50.w),
                            child: MaskWidget(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            child: Center(
                              child: TitleText(
                                AppLocalizations.of(context)
                                    .translate("continue_you_agree"),
                                fontWeight: FontWeight.w400,
                                textColor: AppColors.AGREE_GREY,
                                textDecoration: TextDecoration.underline,
                                size: 25,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 170.h,
                          ),
                          Container(
                            child: Consumer<PhoneNumberNotifier>(
                              builder: (context, PhoneNumberNotifier notifier,
                                  child) {
                                return Container(
                                  width: width,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 50.w),
                                  child: ColorButton(
                                    onPressed: () {
                                      registerPhoneNotifier.registerPhone(
                                          "380" + notifier.phoneNumber);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MultiProvider(
                                            providers: [
                                              ChangeNotifierProvider(
                                                  create: (context) =>
                                                      ApprovePhoneNotifier())
                                            ],
                                            child: EnterSmsScreen(
                                              phoneNumber: notifier.phoneNumber,
                                            ),
                                          ),
                                        ),
                                        // MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         UserDataScreen())
                                      );
                                    },
                                    color: notifier.numberValid
                                        ? AppColors.SPLASH
                                        : AppColors.INACTIVE_GREY,
                                    text: AppLocalizations.of(context)
                                        .translate("further"),
                                    textColor: AppColors.WHITE,
                                    textSize: 35,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )))),
      ),
    );
  }
}
