part of 'search_bloc.dart';

sealed class SearchEvent {}

class SearchdoctorEvent extends SearchEvent {
  final String name;

  SearchdoctorEvent({required this.name});
}
