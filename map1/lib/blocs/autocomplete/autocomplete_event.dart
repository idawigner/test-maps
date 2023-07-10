part of 'autocomplete_bloc.dart';

abstract class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();

  @override
  List<Object> get props => [];
}

class LoadAutocomplete extends AutocompleteEvent {
  final String searchInput;

  // ignore: prefer_const_constructors_in_immutables
  LoadAutocomplete({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}
