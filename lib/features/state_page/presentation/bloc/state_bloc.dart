import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'state_event.dart';
part 'state_state.dart';

class StateBloc extends Bloc<StateEvent, StateState> {
  StateBloc() : super(StateInitial()) {
    on<StateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
