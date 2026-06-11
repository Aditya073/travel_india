import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/hotels_page/domain/usecases/get_data.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final GetHotelsData getHotelsData;
  final String stateName;

  HotelsBloc(this.stateName, {required this.getHotelsData})
    : super(HotelsInitial()) {
    on<HotelsEvent>((event, emit) async {

      try {
      
        final hotels = await getHotelsData();
      
        emit(Success(card: []));
      
      
      } catch (e) {
      
        print(e.toString());
      
        emit(Failure(message: e.toString()));
      }
    });
  }
}
