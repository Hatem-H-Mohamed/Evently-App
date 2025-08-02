import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CatTaps extends StatefulWidget {
  const CatTaps({super.key});

  @override
  State<CatTaps> createState() => _CatTapsState();
}

class _CatTapsState extends State<CatTaps> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'label': S.of(context).All, 'icon': Icons.explore},
      {'label': S.of(context).Sport, 'icon': Icons.directions_bike},
      {'label': S.of(context).Birthday, 'icon': Icons.cake},
      {'label': S.of(context).Meeting, 'icon': Icons.meeting_room},
      {'label': S.of(context).Gaming, 'icon': Icons.videogame_asset},
      {'label': S.of(context).Eating, 'icon': Icons.lunch_dining},
      {'label': S.of(context).Holiday, 'icon': Icons.beach_access},
      {'label': S.of(context).Exhibition, 'icon': Icons.theater_comedy},
      {'label': S.of(context).Workshop, 'icon': Icons.work},
      {'label': S.of(context).BookClub, 'icon': Icons.book},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Theme.of(context).brightness == Brightness.light
                              ? AppColorLight.background
                              : AppColorCommon.primary
                          : Theme.of(context).brightness == Brightness.light
                          ? AppColorCommon.primary
                          : AppColorDark.background,
                  border: Border.all(
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? AppColorLight.background
                            : AppColorCommon.primary,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      category['icon'],
                      size: 18,
                      color:
                          isSelected
                              ? Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.primary
                                  : AppColorLight.background
                              : AppColorLight.background,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      category['label'],
                      style: TextStyle(
                        color:
                            isSelected
                                ? Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColorCommon.primary
                                    : AppColorLight.background
                                : AppColorLight.background,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
