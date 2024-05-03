part of 'dummy_bloc.dart';

sealed class DummyState {
  const DummyState();
}

final class DummyInitial extends DummyState {}

class UploadDummystate extends DummyState {}
