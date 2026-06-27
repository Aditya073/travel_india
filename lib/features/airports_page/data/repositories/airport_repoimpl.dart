import 'package:travel_india/features/airports_page/data/datasource/data_api.dart';
import 'package:travel_india/features/airports_page/data/model/airport_model.dart';

class AirportRepoimpl {
  final DataApi dataSource;

  AirportRepoimpl({required this.dataSource});
  
   Future<List<AirportModel>> getAirportDetails(String stateName) {
    return dataSource.getAirportDetails(stateName);
  }
}
