import 'package:travel_india/features/home_page/data/models/card_model.dart';

abstract class CardRepo {
  Future<CardModel> getCardData();
}
