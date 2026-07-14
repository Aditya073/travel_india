import 'package:travel_india/features/places_page/data/datasource/data_from_places_api.dart';
import 'package:travel_india/features/places_page/data/model/places_model.dart';

class PlacesReopimpl {
  final DataFromPlacesApi datasource;

  PlacesReopimpl({required this.datasource});


  Future<List<PlacesModel>> getBeachDetails(String stateName) {
    return datasource.beach(stateName);
  }


  Future<List<PlacesModel>> getHistoricDetails(String stateName) {
    return datasource.historic(stateName);
  }


  Future<List<PlacesModel>> getWaterFallDetails(String stateName) {
    return datasource.waterFall(stateName);
  }


  Future<List<PlacesModel>> getZooDetails(String stateName) {
    return datasource.zoo(stateName);
  }


  Future<List<PlacesModel>> getMuseumDetails(String stateName) {
    return datasource.museum(stateName);
  }
}
