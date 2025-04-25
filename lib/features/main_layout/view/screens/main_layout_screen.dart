import 'package:evently_app/features/favorite/view/screens/favorite_screen.dart';
import 'package:evently_app/features/home/view/screens/home_screen.dart';
import 'package:evently_app/features/main_layout/view/widgets/custom_bot_nav_bar.dart';
import 'package:evently_app/features/main_layout/view_model/cubit/main_layout_cubit.dart';
import 'package:evently_app/features/map/view/screens/map_screen.dart';
import 'package:evently_app/features/profile/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  List<Widget> screens = [
    HomeScreen(),
    MapScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          int i = 0;
          if (state is MainLayoutNavigation) {
            i = state.index;
          }
          return screens[i];
        },
      ),
      bottomNavigationBar: CustomBotNavBar(),
    );
  }
}
