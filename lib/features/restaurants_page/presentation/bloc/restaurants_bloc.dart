import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/restaurants_page/data/model/restaurant_model.dart';

part 'restaurants_event.dart';
part 'restaurants_state.dart';

class RestaurantsBloc extends Bloc<RestaurantsEvent, RestaurantsState> {
  RestaurantsBloc() : super(RestaurantsInitial()) {
    on<GetRestaurantsEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetCafeEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetFastFoodEvent>((event, emit) {
      // TODO: implement event handler
    });


    on<GetFoodCourtEvent>((event, emit) {
      // TODO: implement event handler
    });


  }
}
