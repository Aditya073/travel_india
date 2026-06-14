import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/features/hotels_page/domain/repositories/hotels_repo.dart';

class GetHotelsData {
  final HotelsRepo repository;
  final String? stateName;

  GetHotelsData({required this.repository, this.stateName});

  Future<List<HotelModel>> call() {
    return repository.getHotels(stateName!);
  }
}
