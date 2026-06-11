import 'package:travel_india/features/hotels_page/domain/repositories/hotels_repo.dart';

class GetHotelsData {
  final HotelsRepo repository;
  final String stateName;

  GetHotelsData({required this.repository, required this.stateName});

  Future<List<dynamic>> call() {
    return repository.getHotels(stateName);
  }
}
