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
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int currentIndex = LangHelper.isArabic() ? 1 : 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 75.h),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/forgetPassword");
                      },
                      child: Text(
                        S.of(context).ForgotPassword,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColorCommon.primary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    title: S.of(context).Login,
                    onPressed: () {
                      Navigator.of(context).pushNamed("/mainLayout");
                    },
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).noAccount,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/signUp");
                        },
                        child: Text(
                          S.of(context).CreateAccount,
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
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColorCommon.primary,
                          thickness: 1.2,
                          endIndent: 16,
                          indent: 26,
                        ),
                      ),
                      Text(
                        S.of(context).Or,
                        style: TextStyle(
                          color: AppColorCommon.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColorCommon.primary,
                          thickness: 1.2,
                          indent: 16,
                          endIndent: 26,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColorCommon.primary),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    icon: SvgPicture.asset(AppIconsSvg.authGoogle),
                    label: Text(
                      S.of(context).LoginwithGoogle,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColorCommon.primary,
                      ),
                    ),
                  ),
                  Spacer(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: CutomAnimatedToggleSwitch(
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
                      onTap: (i) {
                        setState(() {
                          currentIndex = i.values[0];
                        });
                      },
                      onToggle: (i) {
                        setState(() {
                          currentIndex = i;
                        });
                        context.read<MainLayoutCubit>().changeLanguage(
                          currentIndex == 0 ? "en" : "ar",
                        );
                      },
                      current: currentIndex,
                    ),
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
