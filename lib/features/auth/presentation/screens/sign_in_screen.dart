import 'package:evently_app/core/app_assets/icons/App_icons.dart';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/core/widgets/cutom_animated_toggle_switch.dart';
import 'package:evently_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:evently_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int currentIndex = LangHelper.isArabic() ? 1 : 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).Success),
            backgroundColor: AppColorCommon.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/mainLayout', (route) => false);
        }
        if (state is SignInLoading) {
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).Loading),
            backgroundColor: AppColorCommon.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is SignInError) {
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).TryAgain),
            backgroundColor: AppColorCommon.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
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
                      controller: _emailController,
                    ),
                    SizedBox(height: 16.h),
                    AuthField(
                      hintText: S.of(context).Password,
                      isPassword: isVisible,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                      controller: _passwordController,
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
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signInwithEmail(
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                          );
                        }
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
                      onPressed: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.light
                                ? AppColorLight.background
                                : AppColorDark.background,
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
      ),
    );
  }
}
