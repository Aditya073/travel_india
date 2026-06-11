import 'package:travel_india/features/hotels_page/data/datasources/data_from_api.dart';
import 'package:travel_india/features/hotels_page/domain/repositories/hotels_repo.dart';

class HotelsRepoimpl implements HotelsRepo {
  late final DataFromApi dataSource;
  @override
  Future<List<dynamic>> getHotels(String stateName) {
    return dataSource.getHotels(stateName);
  }
}
