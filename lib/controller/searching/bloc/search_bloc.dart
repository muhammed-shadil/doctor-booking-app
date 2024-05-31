import 'package:bloc/bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchdoctorEvent>((event, emit) {
      emit(SearchDoctorsState(result: event.name));
    });
  }
}
