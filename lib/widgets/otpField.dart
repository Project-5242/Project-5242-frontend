
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpFieldWidget extends StatelessWidget {
  final Function(String)? onCompleted;
  const OtpFieldWidget({super.key,this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      borderColor: Colors.black,
      //set to true to show as box or false to show as dash
      showFieldAsBox: true,
      //runs when a code is typed in
      onCodeChanged: (String code) {
        //handle validation or checks here
      },
      //runs when every textfield is filled
      onSubmit: (String verificationCode) {
        onCompleted?.call(verificationCode);
      }, // end onSubmit
    );
  }
}
