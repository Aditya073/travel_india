import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/features/hotels_page/domain/repositories/hotels_repo.dart';

class GetHotelsData {
  final HotelsRepo repository;

  GetHotelsData({required this.repository});

  Future<List<HotelModel>> call(String stateName) {
    return repository.getHotels(stateName);
  }
}
