import 'package:bloc/bloc.dart';

part 'onbording_event.dart';
part 'onbording_state.dart';

class OnbordingBloc extends Bloc<OnbordingEvent, OnbordingState> {
  OnbordingBloc() : super(OnbordingState()) {
    on<OnbordingEvent>((event, emit) {
      emit(OnbordingState(page: state.page));
    });
  }
}
