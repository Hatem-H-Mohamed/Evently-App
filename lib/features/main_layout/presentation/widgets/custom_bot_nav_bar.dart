import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CustomBotNavBar extends StatefulWidget {
  const CustomBotNavBar({super.key});

  @override
  State<CustomBotNavBar> createState() => _CustomBotNavBarState();
}

class _CustomBotNavBarState extends State<CustomBotNavBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomAppBar(
        notchMargin: 3,
        child: BlocBuilder<MainLayoutCubit, MainLayoutState>(
          builder: (context, state) {
            int index = state.index;
            return BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                context.read<MainLayoutCubit>().changeIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(AppIconsSvg.homeSelected),
                  icon: SvgPicture.asset(AppIconsSvg.homeUnselected),
                  label: S.of(context).Home,
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      Theme.of(context).brightness == Brightness.light
                          ? SvgPicture.asset(AppIconsSvg.mapSelected)
                          : SvgPicture.asset(AppIconsSvg.mapSelectedDarkMode),
                  icon: SvgPicture.asset(AppIconsSvg.mapUnselected),
                  label: S.of(context).Map,
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(AppIconsSvg.favSelected),
                  icon: SvgPicture.asset(AppIconsSvg.favUnselected),
                  label: S.of(context).Love,
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(AppIconsSvg.profileSelected),
                  icon: SvgPicture.asset(AppIconsSvg.profileUnselected),
                  label: S.of(context).Profile,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
