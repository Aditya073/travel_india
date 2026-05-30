import 'package:travel_india/features/home_page/data/datasources/firestoreDataSource.dart';
import 'package:travel_india/features/home_page/data/models/card_model.dart';
import 'package:travel_india/features/home_page/domain/repositories/card_repo.dart';

class CardRepoimpl implements CardRepo {
  final Firestoredatasource datasource;

  CardRepoimpl({required this.datasource});

  @override
  Future<CardModel> getCardData() {
    // TODO: implement getCardData
    return datasource.getCardData();
  }
}
