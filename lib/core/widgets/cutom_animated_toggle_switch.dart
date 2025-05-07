import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutomAnimatedToggleSwitch extends StatefulWidget {
  final Function(TapProperties<int>)? onTap;
  final Function(int)? onToggle;
  final List<Widget> icons;
  final int current;
  const CutomAnimatedToggleSwitch({
    super.key,
    this.onTap,
    this.onToggle,
    required this.icons,
    required this.current,
  });

  @override
  State<CutomAnimatedToggleSwitch> createState() =>
      _CutomAnimatedToggleSwitchState();
}

class _CutomAnimatedToggleSwitchState extends State<CutomAnimatedToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      indicatorSize: Size(30.w, 27.h),
      style: ToggleStyle(
        borderColor: AppColorCommon.primary,
        borderRadius: BorderRadius.circular(30.r),
        indicatorBorder: Border.fromBorderSide(
          BorderSide(width: 5.r, color: AppColorCommon.primary),
        ),
        indicatorBorderRadius: BorderRadius.circular(45.r),
        indicatorColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: 31.h,
      spacing: 7.w,
      borderWidth: 3.r,
      current: widget.current,
      values: [0, 1],
      onTap: widget.onTap,
      onChanged: widget.onToggle,
      iconList: widget.icons,
    );
  }
}
