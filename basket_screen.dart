import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tomato_owl/db/db_util.dart';
import 'package:tomato_owl/presenter/screens/basket/widgets/basket_item.dart';
import 'package:tomato_owl/presenter/screens/basket/widgets/promo_button_widget.dart';
import 'package:tomato_owl/presenter/screens/basket/widgets/summary_widget.dart';
import 'package:tomato_owl/presenter/screens/basket/widgets/title_widget.dart';
import 'package:tomato_owl/presenter/widgets/button.dart';
import 'package:tomato_owl/presenter/widgets/text.dart';
import 'package:tomato_owl/presenter/widgets/toolbar_widget.dart';
import 'package:tomato_owl/providers/get_cart_list_notifier.dart';
import 'package:tomato_owl/resources/app_colors.dart';
import 'package:tomato_owl/services/app_localizations.dart';

class BasketScreen extends StatefulWidget {
  final Function function;

  BasketScreen({Key key, this.function}) : super(key: key);

  @override
  State createState() {
    return BasketScreenState();
  }
}

class BasketScreenState extends State<BasketScreen> {
  GetCartListNotifier dbNotifier;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    dbNotifier = Provider.of<GetCartListNotifier>(context, listen: false);
    dbNotifier.getCartList();
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
            key: _scaffoldKey,
            appBar: Toolbar(title: 'basket'),
            body: Consumer<GetCartListNotifier>(
              builder: (context, GetCartListNotifier notifier, child) {
                if (notifier.holder != null &&
                    notifier.holder.list.isNotEmpty) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: width,
                          color: AppColors.BLACK,
                          height: 0.3,
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.w, top: 25.h, bottom: 15.w),
                          child: TitleWidget(
                            list: notifier.holder.list,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: notifier.holder.list.length,
                            itemBuilder: (context, index) {
                              final item = notifier.holder.list[index];
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (direction) {
                                  setState(() {
                                    DBUtil().removeAllProductFromCart(
                                        item, _scaffoldKey.currentContext);
                                  });
                                },
                                // Show a red background as the item is swiped away.
                                background:
                                    Container(color: AppColors.GREY_LINE),
                                child: BasketItem(
                                  key: UniqueKey(),
                                  cart: item,
                                  counterFunction: () {
                                    setState(() {});
                                  },
                                  function: () {
                                    setState(() {
                                      DBUtil().removeAllProductFromCart(
                                          item, _scaffoldKey.currentContext);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          child: PromoButtonWidget(),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          child: SummaryWidget(
                            cartList: notifier.holder.list,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70.h,
                        ),
                        Image.asset(
                          'assets/images/png/ic_pizza.png',
                          width: 413.w,
                          height: 417.h,
                        ),
                        SizedBox(
                          height: 116.h,
                        ),
                        TitleText(
                          AppLocalizations.of(context).translate("empty"),
                          size: 36.22,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: TitleText(
                            AppLocalizations.of(context)
                                .translate("description_basket"),
                            size: 31,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 88.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 130.w),
                          child: ColorButton(
                            text: AppLocalizations.of(context)
                                .translate('go_menu'),
                            onPressed: widget.function,
                            textSize: 35,
                            height: 91.h,
                            color: AppColors.RED_SELECTED,
                            fontWeight: FontWeight.normal,
                            textColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            )),
      ),
    );
  }
}
