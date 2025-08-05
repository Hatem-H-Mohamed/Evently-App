import 'package:evently_app/features/favorite/presentation/screens/favorite_screen.dart';
import 'package:evently_app/features/home/presentation/screens/home_screen.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/features/main_layout/presentation/widgets/custom_bot_nav_bar.dart';
import 'package:evently_app/features/map/presentation/screens/map_screen.dart';
import 'package:evently_app/features/profile/presentation/screens/profile_screen.dart';
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
        onPressed: () {
          Navigator.pushNamed(context, '/createEvent');
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: BlocBuilder<MainLayoutCubit, MainLayoutState>(
        builder: (context, state) {
          int i = state.index;
          return screens[i];
        },
      ),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: CustomBotNavBar(),
      ),
    );
  }
}
