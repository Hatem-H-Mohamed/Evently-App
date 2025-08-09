import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:evently_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:evently_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatTaps extends StatefulWidget {
  final int tapIndex; // 0 = home, 1 = create
  const CatTaps({super.key, required this.tapIndex});

  @override
  State<CatTaps> createState() => _CatTapsState();
}

class _CatTapsState extends State<CatTaps> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'label': S.of(context).All, 'icon': Icons.explore},
      {
        'label': S.of(context).Sport,
        'icon': Icons.directions_bike,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.sport
                : CategoryImagesDark.sport,
      },
      {
        'label': S.of(context).Birthday,
        'icon': Icons.cake,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.birthday
                : CategoryImagesDark.birthday,
      },
      {
        'label': S.of(context).Meeting,
        'icon': Icons.meeting_room,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.meeting
                : CategoryImagesDark.meeting,
      },
      {
        'label': S.of(context).Gaming,
        'icon': Icons.videogame_asset,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.gaming
                : CategoryImagesDark.gaming,
      },
      {
        'label': S.of(context).Eating,
        'icon': Icons.lunch_dining,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.eating
                : CategoryImagesDark.eating,
      },
      {
        'label': S.of(context).Holiday,
        'icon': Icons.beach_access,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.holiday
                : CategoryImagesDark.holiday,
      },
      {
        'label': S.of(context).Exhibition,
        'icon': Icons.theater_comedy,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.exhibition
                : CategoryImagesDark.exhibition,
      },
      {
        'label': S.of(context).Workshop,
        'icon': Icons.work,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.workshop
                : CategoryImagesDark.workshop,
      },
      {
        'label': S.of(context).BookClub,
        'icon': Icons.book,
        'image':
            Theme.of(context).brightness == Brightness.light
                ? CategoryImagesLight.bookClub
                : CategoryImagesDark.bookClub,
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length - widget.tapIndex, (index) {
          final category = categories[index + widget.tapIndex];
          final isSelected =
              selectedIndex + widget.tapIndex == index + widget.tapIndex;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                if (widget.tapIndex == 0) {
                  if (selectedIndex == 0) {
                    context.read<HomeCubit>().getEvent();
                  } else {
                    print(selectedIndex.toString());
                    print("===============");
                    context.read<HomeCubit>().getEventsByImageId(
                      selectedIndex - 1,
                    );
                  }
                } else {
                  context.read<CreateEventCubit>().changeCatImage(
                    selectedIndex,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? widget.tapIndex == 1
                              ? AppColorCommon.primary
                              : Theme.of(context).brightness == Brightness.light
                              ? AppColorLight.background
                              : AppColorCommon.primary
                          : widget.tapIndex == 1
                          ? Colors.transparent
                          : Theme.of(context).brightness == Brightness.light
                          ? AppColorCommon.primary
                          : AppColorDark.background,
                  border: Border.all(
                    color:
                        widget.tapIndex == 1
                            ? AppColorCommon.primary
                            : Theme.of(context).brightness == Brightness.light
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
                              ? widget.tapIndex == 1
                                  ? Theme.of(context).brightness ==
                                          Brightness.light
                                      ? AppColorLight.background
                                      : AppColorDark.background
                                  : Theme.of(context).brightness ==
                                      Brightness.light
                                  ? AppColorCommon.primary
                                  : AppColorLight.background
                              : widget.tapIndex == 1
                              ? AppColorCommon.primary
                              : AppColorLight.background,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      category['label'],
                      style: TextStyle(
                        color:
                            isSelected
                                ? widget.tapIndex == 1
                                    ? Theme.of(context).brightness ==
                                            Brightness.light
                                        ? AppColorLight.background
                                        : AppColorDark.background
                                    : Theme.of(context).brightness ==
                                        Brightness.light
                                    ? AppColorCommon.primary
                                    : AppColorLight.background
                                : widget.tapIndex == 1
                                ? AppColorCommon.primary
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
