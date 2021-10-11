import 'package:WurkFux/constants/colors.dart';
import 'package:WurkFux/constants/images.dart';
import 'package:WurkFux/constants/strings.dart';
import 'package:WurkFux/view/paymentDetails/payment_detail_button.dart';
import 'package:WurkFux/view/paymentDetails/payment_details_topbar.dart';
import 'package:WurkFux/view/utilities/size_config.dart';
import 'package:WurkFux/view/widgets/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardPaymentScreen extends StatefulWidget {
  const CardPaymentScreen({Key? key}) : super(key: key);

  @override
  _CardPaymentScreenState createState() => _CardPaymentScreenState();
}

class _CardPaymentScreenState extends State<CardPaymentScreen> {
  String cardNumber = "2342 4323 4325 3222",
      holderName = "Rubbie Kelvin",
      expiryDate = "09/22";

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
                imagePath: AppImages.paymentDetailCloseIcon,
              ),
              Spacing.mediumHeight(),
              Text(
                AppStrings.PaymentDetailsInfo,
                style: TextStyle(
                    fontSize: getProportionatefontSize(16),
                    fontWeight: FontWeight.w400,
                    color: AppColors.paymentDetailTextColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppStrings.BtcPaymentRoute);
                },
                child: Text(
                  AppStrings.UseBtcInsteadText,
                  style: TextStyle(
                      fontSize: getProportionatefontSize(12),
                      fontWeight: FontWeight.w700,
                      color: AppColors.paymentDetailTextColor),
                ),
              ),
              Spacing.mediumHeight(),
              CardWidget(
                cardNumber: cardNumber,
                holderName: holderName,
                expiryDate: expiryDate,
              ),
              Spacing.betweenCard(),
              cardDetailForm(),
              SizedBox(
                height: getProportionateScreenHeight(64),
              ),
              Center(
                  child: buildPaymentDetailButton(AppStrings.Pay, 166, () {
                Navigator.pushNamed(context, AppStrings.CreateCustomOrder);
              })),
              Spacing.bigHeight()
            ],
          ),
        ),
      ),
    );
  }

  Column cardDetailForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppStrings.CardNumber,
          style: TextStyle(
              fontSize: getProportionatefontSize(11),
              fontWeight: FontWeight.w700,
              color: AppColors.paymentDetailSecondColor),
        ),
        TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                cardNumber = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                AppImages.cardNumberIcon,
                fit: BoxFit.scaleDown,
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(20),
              ),
              hintText: AppStrings.CardNumber,
              hintStyle: TextStyle(
                  fontSize: getProportionatefontSize(16),
                  fontWeight: FontWeight.w400,
                  color: AppColors.paymentDetailSecondColor),
            )),
        Spacing.betweenCardFields(),
        Text(
          AppStrings.HolderName,
          style: TextStyle(
              fontSize: getProportionatefontSize(11),
              fontWeight: FontWeight.w700,
              color: AppColors.paymentDetailSecondColor),
        ),
        TextField(
            onChanged: (value) {
              setState(() {
                holderName = value;
              });
            },
            decoration: InputDecoration(
              prefixIcon: SvgPicture.asset(
                AppImages.holderNameIcon,
                fit: BoxFit.scaleDown,
                height: getProportionateScreenHeight(16),
                width: getProportionateScreenWidth(20),
              ),
              hintText: AppStrings.HolderName,
              hintStyle: TextStyle(
                  fontSize: getProportionatefontSize(16),
                  fontWeight: FontWeight.w400,
                  color: AppColors.paymentDetailSecondColor),
            )),
        Spacing.betweenCardFields(),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.ExpiryDate,
                  style: TextStyle(
                      fontSize: getProportionatefontSize(11),
                      fontWeight: FontWeight.w700,
                      color: AppColors.paymentDetailSecondColor),
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        expiryDate = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        AppImages.calendarIcon,
                        fit: BoxFit.scaleDown,
                        height: getProportionateScreenHeight(16),
                        width: getProportionateScreenWidth(20),
                      ),
                      hintText: AppStrings.ExpiryDate,
                      hintStyle: TextStyle(
                          fontSize: getProportionatefontSize(16),
                          fontWeight: FontWeight.w400,
                          color: AppColors.paymentDetailSecondColor),
                    )),
              ],
            )),
            Spacing.smallWidth(),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.Cvc,
                  style: TextStyle(
                      fontSize: getProportionatefontSize(11),
                      fontWeight: FontWeight.w700,
                      color: AppColors.paymentDetailSecondColor),
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        AppImages.cvcIcon,
                        fit: BoxFit.scaleDown,
                        height: getProportionateScreenHeight(16),
                        width: getProportionateScreenWidth(20),
                      ),
                      hintText: AppStrings.Cvc,
                      hintStyle: TextStyle(
                          fontSize: getProportionatefontSize(16),
                          fontWeight: FontWeight.w400,
                          color: AppColors.paymentDetailSecondColor),
                    )),
              ],
            )),
          ],
        ),
      ],
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      required this.cardNumber,
      required this.holderName,
      required this.expiryDate})
      : super(key: key);
  final String cardNumber, holderName, expiryDate;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(AppImages.masterCardIcon),
            Spacing.bigHeight(),
            Text(cardNumber,
                style: TextStyle(
                    fontSize: getProportionatefontSize(16),
                    fontWeight: FontWeight.w700,
                    color: AppColors.paymentDetailTextColor)),
            Spacing.largeWidth(),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(16)),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppStrings.CardHolder}",
                        style: TextStyle(
                            fontSize: getProportionatefontSize(11),
                            fontWeight: FontWeight.w400,
                            color: AppColors.paymentDetailSecondColor),
                      ),
                      Text(
                        holderName,
                        style: TextStyle(
                            fontSize: getProportionatefontSize(13),
                            fontWeight: FontWeight.w600,
                            color: AppColors.paymentDetailSecondColor),
                      ),
                    ],
                  ),
                  Spacing.mediumWidth(),
                  Column(
                    children: [
                      Text(
                        "${AppStrings.Expires}",
                        style: TextStyle(
                            fontSize: getProportionatefontSize(11),
                            fontWeight: FontWeight.w400,
                            color: AppColors.paymentDetailSecondColor),
                      ),
                      Text(
                        expiryDate,
                        style: TextStyle(
                            fontSize: getProportionatefontSize(13),
                            fontWeight: FontWeight.w600,
                            color: AppColors.paymentDetailSecondColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
