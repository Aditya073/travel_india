import 'package:travel_india/features/home_page/data/models/card_model.dart';
import 'package:travel_india/features/home_page/domain/repositories/card_repo.dart';

class GetcardData {
  final CardRepo repository;

  GetcardData({required this.repository});

  Future<CardModel> call() {
    return repository.getCardData();
  }
}
