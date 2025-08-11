import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_dark.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/widgets/event_card.dart';
import 'package:evently_app/features/favorite/presentation/cubit/fav_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();

    context.read<FavCubit>().getFavs(FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            SearchBar(
              onChanged: (value) => context.read<FavCubit>().searchFav(value),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  side: BorderSide(color: AppColorCommon.primary, width: 1.r),
                ),
              ),
              backgroundColor: WidgetStateProperty.all(
                Theme.of(context).brightness == Brightness.light
                    ? AppColorLight.background
                    : AppColorDark.background,
              ),
              elevation: WidgetStateProperty.all(0),
              hintText: 'Search for events',
              leading: Icon(Icons.search, color: AppColorCommon.primary),
              hintStyle: WidgetStateProperty.all(
                TextStyle(
                  color: AppColorCommon.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textStyle: WidgetStateProperty.all(
                TextStyle(
                  color: AppColorCommon.primary,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocConsumer<FavCubit, FavState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is FavLoading) {
                  return Expanded(
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: AppColorCommon.primary,
                      ),
                    ),
                  );
                } else if (state is FavEmpty) {
                  return const Center(child: Text('No Favorites'));
                } else if (state is FavLoaded) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: EventCard(
                            cardId: state.cardsId[index],
                            imageID: state.events[index]['imageId'],
                            title: state.events[index]['title'],
                            date: state.events[index]['date'],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
