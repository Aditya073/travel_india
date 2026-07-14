import 'package:travel_india/features/places_page/data/model/places_model.dart';
import 'package:travel_india/features/places_page/data/repositories/places_reopimpl.dart';

class GetPlacesData {
  final PlacesReopimpl repository;

  GetPlacesData({required this.repository});

  

  Future<List<PlacesModel>> getBeachDetails(String stateName) {
    return repository.getBeachDetails(stateName);
  }

  Future<List<PlacesModel>> getHistoricDetails(String stateName) {
    return repository.getHistoricDetails(stateName);
  }

  Future<List<PlacesModel>> getWaterFallDetails(String stateName) {
    return repository.getWaterFallDetails(stateName);
  }

  Future<List<PlacesModel>> getZooDetails(String stateName) {
    return repository.getZooDetails(stateName);
  }

  Future<List<PlacesModel>> getMuseumDetails(String stateName) {
    return repository.getMuseumDetails(stateName);
  }
}
