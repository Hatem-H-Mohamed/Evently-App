import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/helper/lang_helper.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    String selectedLanguage = LangHelper.isArabic() ? "ar" : "en";
    String selectedTheme =
        Theme.of(context).brightness == Brightness.light ? 'Light' : 'Dark';
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 170.h,
              decoration: BoxDecoration(
                color: AppColorCommon.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 124.h,
                      width: 124.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(60.r),
                          bottomLeft: Radius.circular(60.r),
                          bottomRight: Radius.circular(60.r),
                        ),
                      ),
                      child: Image.asset(AppImages.profileImage),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Safwat",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColorLight.background,
                          ),
                        ),
                        Text(
                          "johnsafwat.route@gmail.com",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorLight.background,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).Language,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColorCommon.primary),
                      ),
                      child: DropdownButton<String>(
                        menuWidth: 150.w,
                        style: const TextStyle(
                          color: AppColorCommon.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(16),
                        value: selectedLanguage,
                        underline: Container(),
                        icon: SvgPicture.asset(AppIconsSvg.dropListIcon),
                        items: [
                          DropdownMenuItem<String>(
                            value: "en",
                            child: Text(S.of(context).English),
                          ),
                          DropdownMenuItem(
                            value: "ar",
                            child: Text(S.of(context).Arabic),
                          ),
                        ],
                        onChanged: (String? value) {
                          print("Selected Language: $value");
                          setState(() {
                            selectedLanguage = value!;
                          });
                          print(
                            "Updated Language: $selectedLanguage ===============================",
                          );
                          context.read<MainLayoutCubit>().changeLanguage(
                            selectedLanguage,
                          );
                        },
                      ),
                    ),
                    Text(
                      S.of(context).Theme,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColorCommon.primary),
                      ),
                      child: DropdownButton<String>(
                        menuWidth: 150.w,
                        style: const TextStyle(
                          color: AppColorCommon.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(16),
                        value: selectedTheme,
                        underline: Container(),
                        icon: SvgPicture.asset(AppIconsSvg.dropListIcon),
                        items: [
                          DropdownMenuItem<String>(
                            value: "Light",
                            child: Text(S.of(context).Light),
                          ),
                          DropdownMenuItem(
                            value: "Dark",
                            child: Text(S.of(context).Dark),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            selectedTheme = value!;
                          });

                          context.read<MainLayoutCubit>().toggleTheme(
                            selectedTheme,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 265.h),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          const Color(0xFFFF5659),
                        ),
                        alignment: Alignment.centerLeft,
                        foregroundColor: WidgetStateProperty.all(
                          AppColorLight.background,
                        ),
                        iconColor: WidgetStatePropertyAll(
                          AppColorLight.background,
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.logout),
                      label: Text(S.of(context).Logout),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
