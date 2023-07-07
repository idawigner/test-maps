import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map1/blocs/geolocation/geolocation_bloc.dart';
import 'package:map1/screens/location/components/gmap.dart';
import 'package:map1/screens/location/components/location_search_box.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Location',
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          automaticallyImplyLeading: true,
        ),
        body: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
                  if (state is GeolocationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeolocationLoaded) {
                    return Gmap(
                      lat: state.position.latitude,
                      lng: state.position.longitude,
                    );
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ),
            const Positioned(
              left: 05,
              top: 02,
              right: 50,
              child: LocationSearchBox(),
            ),
            Positioned(
                left: 20,
                bottom: 30,
                right: 20,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sW * 0.3),
                  child: ElevatedButton(
                    child: const Text('Save'),
                    onPressed: () {},
                  ),
                ))
          ],
        ));
  }
}
