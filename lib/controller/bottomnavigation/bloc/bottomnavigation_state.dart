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
