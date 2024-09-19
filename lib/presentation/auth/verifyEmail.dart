import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/base/base.dart';
import 'package:flutter_project/domain/bloc/auth/bloc.dart';
import 'package:flutter_project/main.dart';

import '../../data/constants/app_string.dart';
import '../../data/constants/responsive_view.dart';
import '../../widgets/otpField.dart';
import '../widgets/app_rich_text.dart';
import '../widgets/custom_button.dart';

class VerifyEmailPage extends StatefulWidget {
  final String email;
  const VerifyEmailPage({super.key, required this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final responseive = ResponsiveCheck(context);

    return LayoutBuilder(builder: (context, constraints) {
      bool isDesktop = constraints.maxWidth > 800;
      return Scaffold(
        appBar: AppBar(
          leading: isDesktop
              ? null
              : IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 21.0,
                    color: Colors.black,
                  )),
          title: isDesktop
              ? null
              : const Text(
                  AppStrings.verifyOtp,
                ),
          automaticallyImplyLeading: isDesktop ? false : true,
          centerTitle: isDesktop ? false : true,
        ),
        body: ListView(
          padding: responseive.isTablet
              ? const EdgeInsets.symmetric(
                  horizontal: 90,
                )
              : responseive.isDesktop
                  ? const EdgeInsets.symmetric(
                      horizontal: 30,
                    )
                  : const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
          children: [
            if (isDesktop) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        //height: MediaQuery.of(context).size.height * 0.010,
                        width: MediaQuery.of(context).size.width * 0.500,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.forgetPassword,
                              style: context.customFont('Open Sans', 32.0,
                                  FontWeight.w700, AppColors.themeColor),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.070,
                            ),
                            Text(
                              AppStrings.verifyOtp,
                              style: context.customFont('Open Sans', 20.0,
                                  FontWeight.w700, Colors.black),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            ),
                            Text(
                              'Please enter 4 digit code sent to your e-mail :-',
                              style: context.customFont(
                                'Open Sans',
                                16.0,
                                FontWeight.w400,
                                AppColors.black.withOpacity(0.3),
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.026,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.090,
                              width: MediaQuery.of(context).size.width * 0.250,
                              child: OtpFieldWidget(
                                onCompleted: (val) {
                                  _otpController.text = val;
                                  setState(() {});
                                },
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.030,
                            ),
                            RichTextWidget(
                                size: 14.0,
                                decoration: TextDecoration.underline,
                                color: AppColors.black.withOpacity(0.3),
                                color1: AppColors.themeColor,
                                text: AppStrings.dontReceiveCode,
                                text1: AppStrings.resend,
                                onTap: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(ResendOtpEvent(widget.email));
                                  // _dialogeBox(context);
                                }),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.160,
                            ),
                            CustomButton(
                              onTap: () {
                                if (_otpController.text.length == 4) {
                                  context.read<AuthBloc>().add(VerifyEmailEvent(
                                      widget.email, _otpController.text));
                                }
                              },
                              height:
                                  MediaQuery.of(context).size.height * 0.085,
                              width: MediaQuery.of(context).size.width * 0.200,
                              text: AppStrings.verify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.103,
                    ),
                    Image.asset(
                      AssetsRes.PASSWORD2,
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height * 0.400,
                      width: MediaQuery.of(context).size.width * 0.300,
                    )
                  ],
                ),
              ),
            ] else ...[
              Image.asset(
                AssetsRes.PASSWORD2,
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.150,
                width: MediaQuery.of(context).size.width * 0.150,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.024,
              ),
              Text(
                textAlign: TextAlign.center,
                AppStrings.verifyOtp,
                style: context.customFont(
                    'Open Sans', 20.0, FontWeight.w700, Colors.black),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.010,
              ),
              Text(
                textAlign: TextAlign.center,
                AppStrings.enter4Digit,
                style: context.customFont(
                  'Open Sans',
                  16.0,
                  FontWeight.w400,
                  AppColors.black.withOpacity(0.3),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.026,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.060,
                  // width: MediaQuery.of(context).size.width * 0.276,
                  child: OtpFieldWidget(
                    onCompleted: (val) {
                      _otpController.text = val;
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              RichTextWidget(
                  size: 16,
                  decoration: TextDecoration.underline,
                  color: AppColors.black.withOpacity(0.3),
                  color1: AppColors.themeColor,
                  text: AppStrings.dontReceiveCode,
                  text1: AppStrings.resend,
                  onTap: () {
                    context
                                      .read<AuthBloc>()
                                      .add(ResendOtpEvent(widget.email));
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.131,
              ),
              CustomButton(
                onTap: () {
                  if (_otpController.text.length == 4) {
                    context.read<AuthBloc>().add(
                        VerifyEmailEvent(widget.email, _otpController.text));
                  }
                },
                height: MediaQuery.of(context).size.height * 0.060,
                width: MediaQuery.of(context).size.width * 0.275,
                text: AppStrings.verify,
              ),
            ],
          ],
        ),
      );
    });
  }
}
