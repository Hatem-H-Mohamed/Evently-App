import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:evently_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int currentIndex = LangHelper.isArabic() ? 1 : 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isVisible1 = true;
  bool isVisible2 = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).Success),
            backgroundColor: AppColorCommon.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil('/mainLayout', (route) => false);
        } else if (state is SignUpLoading) {
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).Loading),
            backgroundColor: AppColorCommon.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is SignUpError) {
          SnackBar snackBar = SnackBar(
            content: Text(S.of(context).TryAgain),
            backgroundColor: AppColorCommon.primary,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).Register),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          key: _formKey,
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
                      controller: _nameController,
                    ),
                    SizedBox(height: 16.h),
                    AuthField(
                      hintText: S.of(context).Email,
                      isPassword: false,
                      prefixIcon: Icon(Icons.email),
                      controller: _emailController,
                    ),
                    SizedBox(height: 16.h),
                    AuthField(
                      hintText: S.of(context).Password,
                      isPassword: isVisible1,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible1 ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible1 = !isVisible1;
                          });
                        },
                      ),
                      controller: _passwordController,
                      validator: (p) {
                        if (p == null || p.isEmpty) {
                          return 'Please enter a password';
                        } else if (p.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    AuthField(
                      hintText: S.of(context).RePassword,
                      isPassword: isVisible2,
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isVisible2 ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible2 = !isVisible2;
                          });
                        },
                      ),
                      controller: _confirmPasswordController,
                      validator: (p2) {
                        if (p2 == null || p2.isEmpty) {
                          return 'Please confirm your password';
                        } else if (p2 != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    Spacer(),
                    CustomElevatedButton(
                      title: S.of(context).CreateAccount,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                          context.read<AuthCubit>().signUpwithEmail(
                            _nameController.text.trim(),
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
                          S.of(context).AlreadyHaveAccount,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
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
      ),
    );
  }
}
