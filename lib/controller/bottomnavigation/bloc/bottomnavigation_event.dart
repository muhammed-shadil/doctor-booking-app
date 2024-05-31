part of 'bottomnavigation_bloc.dart';

sealed class BottomnavigationEvent {
  const BottomnavigationEvent();
}

class ChangeindexEvent extends BottomnavigationEvent {
  final int changeindex;
  const ChangeindexEvent({
    required this.changeindex,
  });
}
