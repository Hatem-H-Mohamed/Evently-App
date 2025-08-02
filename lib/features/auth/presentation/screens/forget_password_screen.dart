import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).ForgetPassword),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: SizedBox(
              height: 690.h,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.authForgetPass,
                    width: 343.w,
                    height: 335.h,
                  ),
                  SizedBox(height: 24.h),
                  AuthField(
                    hintText: S.of(context).Email,
                    isPassword: false,
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 16.h),
                  CustomElevatedButton(
                    title: S.of(context).ResetPassword,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
