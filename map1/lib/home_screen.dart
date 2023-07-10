import 'package:flutter/material.dart';
import 'package:map1/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        leading: IconButton(
          icon: const Icon(Icons.location_pin),
          onPressed: () => Navigator.pushNamed(context, AppRoutes.map),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.home),
              icon: const Icon(Icons.home),
              label: const Text('Go to Home'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.location),
              icon: const Icon(Icons.location_pin),
              label: const Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
