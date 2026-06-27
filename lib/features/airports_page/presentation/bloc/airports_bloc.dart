import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/airports_page/data/model/airport_model.dart';
import 'package:travel_india/features/airports_page/domain/usecase/get_data.dart';

part 'airports_event.dart';
part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  final GetAirportData getAirportData;

  AirportsBloc(this.getAirportData) : super(AirportsInitial()) {
    on<GetAirportEvent>((event, emit) async {
      emit(AirportsLoading());
      try {
        print(event.stateName);

        final airports = await getAirportData(event.stateName);

        emit(Success(airports: airports));
      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });
  }
}
