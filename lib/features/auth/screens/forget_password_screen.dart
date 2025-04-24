import 'package:evently_app/core/app_assets/app_assets.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/auth/widgets/auth_field.dart';
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
      appBar: AppBar(title: const Text('Forget Password'), centerTitle: true),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Image.asset(
                AppAssets.authForgetPass,
                width: 343.w,
                height: 335.h,
              ),
              SizedBox(height: 24.h),
              AuthField(
                hintText: "Email",
                isPassword: false,
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 16.h),
              CustomElevatedButton(title: "Reset Password", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
