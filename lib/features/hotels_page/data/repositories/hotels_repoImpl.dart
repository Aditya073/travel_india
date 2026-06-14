import 'package:travel_india/features/hotels_page/data/datasources/data_from_api.dart';
import 'package:travel_india/features/hotels_page/data/models/hotel_model.dart';
import 'package:travel_india/features/hotels_page/domain/repositories/hotels_repo.dart';

class HotelsRepoimpl implements HotelsRepo {
  final DataFromApi dataSource;

  HotelsRepoimpl({required this.dataSource});
  @override
  Future<List<HotelModel>> getHotels(String stateName) {
    return dataSource.getHotels(stateName);
  }
}
