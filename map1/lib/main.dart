import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map1/app_routes.dart';
import 'package:map1/blocs/geolocation/geolocation_bloc.dart';
import 'package:map1/repositories/geolocation/geolocation_repository.dart';
import 'package:map1/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation()))
        ],
        child: MaterialApp(
          title: 'Maps 1',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.location,
        ),
      ),
    );
  }
}