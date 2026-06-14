import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/features/hotels_page/domain/usecases/get_data.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final GetHotelsData getHotelsData;

  HotelsBloc(this.getHotelsData,)
    : super(HotelsInitial()) {
    on<GetHotelsEvent>((event, emit) async {

      try {
      
        final hotels = await getHotelsData();
      
        emit(Success(card: hotels));
      
      
      } catch (e) {
      
        print(e.toString());
      
        emit(Failure(message: e.toString()));
      }
    });
  }
}
