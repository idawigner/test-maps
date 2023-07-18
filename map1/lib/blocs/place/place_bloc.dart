import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map1/repositories/places/places_repository.dart';
import '../../models/place_model.dart';

part 'place_state.dart';
part 'place_event.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  PlaceBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(PlaceLoading());

  @override
  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if (event is LoadPlace) {
      yield* _mapLoadPlaceToState(event);
    }
  }

  Stream<PlaceState> _mapLoadPlaceToState(LoadPlace event) async* {
    yield PlaceLoading();
    try {
      _placesSubscription?.cancel();
      final Place place = await _placesRepository.getPlace(event.placeId);
      yield PlaceLoaded(place: place);
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _placesSubscription?.cancel();
    return super.close();
  }
}
