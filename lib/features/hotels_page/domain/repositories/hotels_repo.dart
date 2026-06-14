import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';

abstract class HotelsRepo {
  Future<List<HotelModel>> getHotels(String stateName);
}
