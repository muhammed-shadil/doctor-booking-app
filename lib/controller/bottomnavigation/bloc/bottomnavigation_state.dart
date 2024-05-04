// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottomnavigation_bloc.dart';

sealed class BottomnavigationState {
  const BottomnavigationState();

}

class BottomnavigationInitial extends BottomnavigationState {
  final int changedindex;
  BottomnavigationInitial({
    required this.changedindex,
  });
 }
