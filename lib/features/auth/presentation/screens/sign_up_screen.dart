import 'package:evently_app/core/app_assets/icons/App_icons.dart';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/cutom_animated_toggle_switch.dart';
import 'package:evently_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentIndex = LangHelper.isArabic() ? 1 : 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Register),
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
                    hintText: S.of(context).Name,
                    isPassword: false,
                    prefixIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: S.of(context).Email,
                    isPassword: false,
                    prefixIcon: Icon(Icons.email),
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: S.of(context).Password,
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 16.h),
                  AuthField(
                    hintText: S.of(context).RePassword,
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    title: S.of(context).CreateAccount,
                    onPressed: () {},
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).AlreadyHaveAccount,
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
                          S.of(context).Login,
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
