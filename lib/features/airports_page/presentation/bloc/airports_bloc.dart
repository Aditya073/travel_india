import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'airports_event.dart';
part 'airports_state.dart';

class AirportsBloc extends Bloc<AirportsEvent, AirportsState> {
  AirportsBloc() : super(AirportsInitial()) {
    on<AirportsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
