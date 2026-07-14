import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/restaurants_page/data/model/restaurant_model.dart';
import 'package:travel_india/features/restaurants_page/domain/usecase/get_data.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  final GetData getData;
  RestaurantsBloc(this.getData) : super(RestaurantsInitial()) {
    on<GetRestaurantsEvent>((event, emit) async {
      // TODO: implement event handler 
      emit(Loading());
      try {
        final restaurent = await getData.getRestaurantDetail(event.stateName);

        emit(Success(restaurant: restaurent));

      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetCafeEvent>((event, emit) async {
      // TODO: implement event handler
      emit(Loading());
      try {
        final restaurent = await getData.getCafeDetail(event.stateName);

        emit(Success(restaurant: restaurent));

      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetFastFoodEvent>((event, emit) async {
      // TODO: implement event handler
      emit(Loading());
      try {
        final restaurent = await getData.getFastFoodDetail(event.stateName);

        emit(Success(restaurant: restaurent));

      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });

    on<GetFoodCourtEvent>((event, emit) async {
      // TODO: implement event handler
      emit(Loading());
      try {
        final restaurent = await getData.getFoodCourtDetail(event.stateName);

        emit(Success(restaurant: restaurent));

      } catch (e) {
        emit(Failure(message: e.toString()));
        rethrow;
      }
    });
  }
}
