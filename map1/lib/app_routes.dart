import 'package:flutter/material.dart';
import 'package:map1/constant.dart';
import 'package:map1/home_screen.dart';
import 'package:map1/location/location_screen.dart';
import 'package:map1/map_sample.dart';

class AppRoutes {
  static const String home = '/home';
  static const String map = '/map';
  static const String location = '/location';
  // Add other route names here
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.map:
        return MaterialPageRoute(builder: (_) => const MapSample());
      case AppRoutes.location:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
      // Add cases for other screens/routes
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: rPrimaryColor,
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }

  static bool onWillPop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).maybePop();
      return false;
    }
    return true;
  }
}
