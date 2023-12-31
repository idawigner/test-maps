import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map1/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:map1/blocs/geolocation/geolocation_bloc.dart';
import 'package:map1/screens/location/components/gmap.dart';
import 'package:map1/screens/location/components/location_search_box.dart';

import '../../blocs/place/place_bloc.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;
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
      body: BlocBuilder<PlaceBloc, PlaceState>(
        builder: (context, state) {
          if (state is PlaceLoading) {
            return Stack(
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
                Location(sH: sH),
                SaveButton(sW: sW)
              ],
            );
          } else if (state is PlaceLoaded) {
            return Stack(
              children: [
                Gmap(
                  lat: state.place.lat,
                  lng: state.place.lon,
                ),
                SaveButton(sW: sW),
                Location(sH: sH),
              ],
            );
          } else {
            return const Text('Something went wrong!');
          }
        },
      ),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.sH,
  });

  final double sH;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 05,
      top: 02,
      right: 50,
      child: Column(
        children: [
          const LocationSearchBox(),
          BlocBuilder<AutocompleteBloc, AutocompleteState>(
            builder: (context, state) {
              if (state is AutocompleteLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AutocompleteLoaded) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  height: sH * 0.3,
                  color: state.autocomplete.isNotEmpty
                      ? Colors.black.withOpacity(0.6)
                      : Colors.transparent,
                  child: ListView.builder(
                      itemCount: state.autocomplete.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.autocomplete[index].description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                          onTap: () {
                            context.read<PlaceBloc>().add(
                                  LoadPlace(
                                    placeId: state.autocomplete[index].placeId,
                                  ),
                                );
                          },
                        );
                      }),
                );
              } else {
                return const Text('Something Wrong in loc-sc!');
              }
            },
          ),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.sW,
  });

  final double sW;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20,
        bottom: 30,
        right: 20,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sW * 0.3),
          child: ElevatedButton(
            child: const Text('Save'),
            onPressed: () {},
          ),
        ));
  }
}
