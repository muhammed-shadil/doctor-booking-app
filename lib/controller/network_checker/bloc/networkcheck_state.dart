// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'networkcheck_bloc.dart';

sealed class NetworkcheckState {
  const NetworkcheckState();
  

}

final class NetworkcheckInitial extends NetworkcheckState {
   final bool isalerted=false;
}
class isAlertSetState extends NetworkcheckState {
  final bool isalerted;
  isAlertSetState({
    required this.isalerted,
  });
}
