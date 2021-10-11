import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wurkfux/constants/colors.dart';
import 'package:wurkfux/constants/images.dart';
import 'package:wurkfux/constants/strings.dart';
import 'package:wurkfux/view/payment/payment_detail_button.dart';
import 'package:wurkfux/view/payment/payment_details_topbar.dart';
import 'package:wurkfux/view/utilities/size_config.dart';
import 'package:wurkfux/view/widgets/spacing.dart';

class BtcPaymentScreen extends StatelessWidget {
  const BtcPaymentScreen({Key? key}) : super(key: key);
  final String btcAddress = "3J9*t1WpEZxxxxxxxxxxxQviecrnjkQtW67WNLOi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentDetailTopBar(
                title: AppStrings.PaymentDetails,
                imagePath: AppImages.closeBig,
              ),
              Spacing.mediumHeight(),
              Text(
                AppStrings.BtcPayInfo,
                style: TextStyle(
                    fontSize: getProportionatefontSize(16),
                    fontWeight: FontWeight.w400,
                    color: AppColors.paymentDetailTextColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppStrings.CardPaymentRoute);
                },
                child: Text(
                  AppStrings.UseCardInsteadText,
                  style: TextStyle(
                      fontSize: getProportionatefontSize(12),
                      fontWeight: FontWeight.w700,
                      color: AppColors.paymentDetailTextColor),
                ),
              ),
              Spacing.bigHeight(),
              Container(
                height: getProportionateScreenHeight(250),
                width: getProportionateScreenWidth(315),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.neutralGrey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 9)
                    ],
                    border: Border.all(width: 2.0, color: AppColors.lightGrey),
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacing.bigHeight(),
                      Text(btcAddress,
                          style: TextStyle(
                              fontSize: getProportionatefontSize(16),
                              fontWeight: FontWeight.w700,
                              color: AppColors.paymentDetailTextColor)),
                      Spacing.largeHeight(),
                      TextButton(
                        onPressed: () {
                          _copyToClipBoard(context);
                        },
                        child: Text(
                          AppStrings.Copy,
                          style: TextStyle(
                              color: AppColors.paymentDetailTextColor),
                        ),
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(20))),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => AppColors.lightGrey),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                      )
                    ],
                  ),
                ),
              ),
              Spacing.betweenCard(),
              Text(
                AppStrings.TransactionId,
                style: TextStyle(
                    fontSize: getProportionatefontSize(11),
                    fontWeight: FontWeight.w700,
                    color: AppColors.paymentDetailSecondColor),
              ),
              TextField(
                  decoration: InputDecoration(
                hintText: AppStrings.TnxId,
                hintStyle: TextStyle(
                    fontSize: getProportionatefontSize(16),
                    fontWeight: FontWeight.w400,
                    color: AppColors.paymentDetailSecondColor),
              )),
              Spacing.extraLargHeight(),
              Center(
                  child:
                      buildPaymentDetailButton(AppStrings.Submit, 191, () {})),
              Spacing.mediumHeight()
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _copyToClipBoard(BuildContext buildContext) async {
    await Clipboard.setData(ClipboardData(text: btcAddress));
    ScaffoldMessenger.maybeOf(buildContext)
        ?.showSnackBar(SnackBar(content: Text("Copied!")));
  }
}
