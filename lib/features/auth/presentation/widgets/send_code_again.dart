import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_duration.dart';

class SendCodeAgain extends StatefulWidget {
  final VoidCallback onResend;

  const SendCodeAgain({super.key, required this.onResend});

  @override
  State<SendCodeAgain> createState() => _SendCodeAgainState();
}

class _SendCodeAgainState extends State<SendCodeAgain> {
  int remainingSeconds = 20;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(AppDuration.sendCodeAgainDuration, (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _resendCode() {
    widget.onResend();
    setState(() {
      remainingSeconds = 20;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: remainingSeconds == 0 ? _resendCode : null,
      child: Text(
        remainingSeconds == 0
            ? 'Send code again'
            : 'Send code again in ${remainingSeconds.toString().padLeft(2, '0')}s',
        style: TextStyle(
          fontSize: 16.0.sp,
          fontWeight: FontWeight.w600,
          color: remainingSeconds == 0 ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
// TODO Rfactor
