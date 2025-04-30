import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/sizedbox_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_utils.dart';

class AuthFormField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;

  const AuthFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.isEmail = false,
  });

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool _obscureText = true;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () {
      final text = widget.controller.text.trim();
      bool valid = false;
      if (widget.isEmail) {
        valid = AppUtils.isEmailValid(text);
        if (valid != _isEmailValid) setState(() => _isEmailValid = valid);
      } else if (widget.isPassword) {
        valid = AppUtils.isPasswordValid(text);
        if (valid != _isPasswordValid) setState(() => _isPasswordValid = valid);
      }
    };
    if (widget.isEmail || widget.isPassword) {
      widget.controller.addListener(_listener);
      _listener();
    }
  }

  @override
  void dispose() {
    if (widget.isEmail || widget.isPassword) {
      widget.controller.removeListener(_listener);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.authFormLabel,
        ),
        verticalSpace(6),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 57.h),
          child: TextFormField(
            cursorColor: AppColor.black,
            validator: widget.isEmail
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!AppUtils.isEmailValid(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  }
                : widget.isPassword
                    ? (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (!AppUtils.isPasswordValid(value)) {
                          return 'Password must be at least 8 chars\nwith upper/lowercase & a numbers';
                        }
                        return null;
                      }
                    : null,
            controller: widget.controller,
            obscureText: widget.isPassword && _obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 16.h,
              ),
              border: OutlineInputBorder(),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.isPassword)
                    IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 20.sp,
                      ),
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                    ),
                  if ((widget.isEmail && _isEmailValid))
                    Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


//TODO refactor