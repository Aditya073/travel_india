import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/places_page/data/model/places_model.dart';
import 'package:travel_india/features/places_page/domain/usecase/get_places_data.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesData getPlacesData;
  PlacesBloc(this.getPlacesData) : super(PlacesInitial()) {
    on<GetBeachEvent>((event, emit) async {
      emit(Loading());
      try {
        final beachDetails = await getPlacesData.getBeachDetails(
          event.stateName,
        );

        emit(Success(palceModels: beachDetails));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetHistoricEvent>((event, emit) async {
      emit(Loading());
      try {
        final historicDetails = await getPlacesData.getHistoricDetails(
          event.stateName,
        );

        emit(Success(palceModels: historicDetails));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetMuseumEvent>((event, emit) async {
      emit(Loading());
      try {
        final museumDetails = await getPlacesData.getMuseumDetails(
          event.stateName,
        );

        emit(Success(palceModels: museumDetails));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetWaterFallEvent>((event, emit) async {
      emit(Loading());
      try {
        final waterFallDetails = await getPlacesData.getWaterFallDetails(
          event.stateName,
        );

        emit(Success(palceModels: waterFallDetails));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetZooEvent>((event, emit) async {
      emit(Loading());
      try {
        final zooDetails = await getPlacesData.getZooDetails(event.stateName);

        emit(Success(palceModels: zooDetails));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetleisureEvent>((event, emit) async {
      emit(Loading());
      try {
        final leisureDetails = await getPlacesData.getZooDetails(event.stateName);

        emit(Success(palceModels: leisureDetails));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });
  }
}
