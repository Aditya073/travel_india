import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_india/features/home_page/data/models/card_model.dart';
import 'package:travel_india/features/home_page/domain/usecases/getCardData.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetcardData getCardData;
  CardBloc(this.getCardData) : super(CardInitial()) {
    on<GetCardData>((event, emit) async {
      emit(CardLoading());

      try {
        final card = await getCardData();

       if (card.) {
          emit(Failure(message: ));
          return;
        }

        emit(Success(cardModel: ));
      } catch (e) {}
    });
  }
}
