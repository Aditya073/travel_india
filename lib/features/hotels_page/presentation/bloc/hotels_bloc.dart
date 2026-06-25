import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/features/hotels_page/domain/usecases/get_data.dart';
part 'hotels_event.dart';
part 'hotels_state.dart';

class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final GetHotelsData getHotelsData;

  HotelsBloc(this.getHotelsData) : super(HotelsInitial()) {
    on<GetHotelsEvent>((event, emit) async {
      emit(HotelsLoading());
      try {
        print("Fetching hotels...");
        print("!!!!!!!!!!!!!!!!event.stateName!!!!!!!!!!!!!!!");
        print(event.stateName);

        final hotels = await getHotelsData(event.stateName);

        //  final List<Map<String, dynamic>> hotelMarker = [];
        // for (var hotel in hotels) {
        //   hotelMarker.add({
        //     "name": hotel.name,
        //     "lat": hotel.latitude,
        //     "lon": hotel.longitude,
        //   });
        // }

        // print(
        //   "!!!!!!!!!!!!!!!!!!!!!!!!!!!!! hotelMarker.asMap() **********************",
        // );
        // print(hotelMarker.asMap());

        print("Hotels fetched: ${hotels.length}");

        emit(Success(card: hotels));
      } catch (e, stackTrace) {
        print("ERROR: $e");
        print(stackTrace);

        emit(Failure(message: e.toString()));
      }
    });
  }
}
