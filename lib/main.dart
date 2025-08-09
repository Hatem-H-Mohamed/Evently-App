import 'package:evently_app/core/di/service_locator.dart';
import 'package:evently_app/evently_app.dart';
import 'package:evently_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:evently_app/features/favorite/presentation/cubit/fav_cubit.dart';
import 'package:evently_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final isFirst = prefs.getBool('isFirst') ?? true;
  final isLogged = prefs.getBool('isLogged') ?? false;
  final lang = prefs.getString('lang') ?? 'en';
  final theme = prefs.getString('theme') ?? 'Light';
  await dotenv.load(fileName: ".env");
  MapboxOptions.setAccessToken(dotenv.env['MAPBOX_ACCESS_TOKEN']!);

  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainLayoutCubit(lang: lang, theme: theme)),
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => FavCubit()),
        BlocProvider(create: (_) => sl<CreateEventCubit>()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: EventlyApp(
        isFirst: isFirst,
        isLogged: isLogged,
        lang: lang,
        theme: theme,
      ),
    ),
  );
}
