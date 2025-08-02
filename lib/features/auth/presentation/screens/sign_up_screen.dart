import 'package:evently_app/core/app_assets/icons/App_icons.dart';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/cutom_animated_toggle_switch.dart';
import 'package:evently_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
            child: SizedBox(
              height: 690.h,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.splashLogo,
                    height: 186.h,
                    width: 136.w,
                  ),
                  Spacer(),
                  AuthField(
                    hintText: "Name",
                    isPassword: false,
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: "Email",
                    isPassword: false,
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: "Password",
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: "Re Password",
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    title: "Creat Account",
                    onPressed: () {},
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ? ",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Navigate to sign-up screen
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColorCommon.primary,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColorCommon.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 2),
                  CutomAnimatedToggleSwitch(
                    icons: [
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppIconsSvg.onboardingUsa,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SvgPicture.asset(
                        fit: BoxFit.fill,
                        AppIconsSvg.onboardingEg,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ],
                    onTap: (i) {},
                    onToggle: (i) {},
                    current: 0,
                  ),
                  Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
