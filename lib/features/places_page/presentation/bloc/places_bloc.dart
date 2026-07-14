import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/places_page/data/model/places_model.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  PlacesBloc() : super(PlacesInitial()) {
    on<PlacesEvent>((event, emit) {
      // TODO: implement event handler 
    });
  }
}
