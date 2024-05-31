// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'networkcheck_bloc.dart';

sealed class NetworkcheckEvent{
  const NetworkcheckEvent();

 
}
class isAlertSetEvent extends NetworkcheckEvent {
  final bool isalert;
  isAlertSetEvent({
    required this.isalert,
  });
}
