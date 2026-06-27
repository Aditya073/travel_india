import 'package:travel_india/features/airports_page/data/model/airport_model.dart';
import 'package:travel_india/features/airports_page/data/repositories/airport_repoimpl.dart';

class GetAirportData {
  final AirportRepoimpl repository;

  GetAirportData({required this.repository});
  
  Future<List<AirportModel>> call(String stateName) {
    return repository.getAirportDetails(stateName);
  }
}
