import 'package:bloc/bloc.dart';

part 'bottomnavigation_event.dart';
part 'bottomnavigation_state.dart';

class BottomnavigationBloc
    extends Bloc<BottomnavigationEvent, BottomnavigationState> {
  BottomnavigationBloc() : super(BottomnavigationInitial(changedindex: 0)) {
    on<ChangeindexEvent>((event, emit) {
      emit(BottomnavigationInitial(changedindex: event.changeindex));
    });
  }
}
