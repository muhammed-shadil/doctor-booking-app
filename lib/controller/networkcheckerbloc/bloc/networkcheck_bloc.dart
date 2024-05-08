import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'networkcheck_event.dart';
part 'networkcheck_state.dart';

class NetworkcheckBloc extends Bloc<NetworkcheckEvent, NetworkcheckState> {
  NetworkcheckBloc() : super(NetworkcheckInitial()) {
    on<isAlertSetEvent>((event, emit) {
      emit(isAlertSetState(isalerted:event.isalert));
    });
  }
}
