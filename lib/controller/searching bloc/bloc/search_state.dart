// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchDoctorsState extends SearchState {
  final String result;
  SearchDoctorsState({
    required this.result,
  });
}
