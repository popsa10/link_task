import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_task/features/auth/model/user_model.dart';

import '../../../generated/locale_keys.g.dart';
import '../cubits/auth_cubit/auth_cubit.dart';

class VerificationCodeResentTimerWidget extends StatefulWidget {
  final String phoneNumber;
  const VerificationCodeResentTimerWidget({super.key, required this.phoneNumber});

  @override
  State<VerificationCodeResentTimerWidget> createState() => _VerificationCodeResentTimerWidgetState();
}

class _VerificationCodeResentTimerWidgetState extends State<VerificationCodeResentTimerWidget> {

  late Timer _timer;
  int _remainingTime = 59;

  String formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remainingSeconds';
  }// Timer duration in seconds

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  void startTimer() {
    _remainingTime = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Text.rich(TextSpan(
        children: [
          TextSpan(
              text: "${LocaleKeys.didNotGetCode.tr()} ",
              style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500)
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap =  _remainingTime > 0 ? null : () {
                  context.read<AuthCubit>().login(UserModel(
                    phone: widget.phoneNumber
                  ));
                  startTimer();
                },
              text: _remainingTime > 0 ? formatTime(_remainingTime) : LocaleKeys.resend.tr(),
              style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,decoration: _remainingTime > 0 ?  null : TextDecoration.underline)
          ),
        ]
    ));
  }
}
