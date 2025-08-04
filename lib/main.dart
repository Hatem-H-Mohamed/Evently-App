import 'package:evently_app/core/di/service_locator.dart';
import 'package:evently_app/evently_app.dart';
import 'package:evently_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:evently_app/features/main_layout/presentation/cubit/cubit/main_layout_cubit.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MainLayoutCubit()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: const EventlyApp(),
    ),
  );
}
