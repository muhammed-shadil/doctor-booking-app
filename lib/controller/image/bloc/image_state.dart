part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}

class Uploadimagefailure extends ImageState {
  final String msg;

  Uploadimagefailure({required this.msg});
}

class Uploadimageloading extends ImageState {}

class uploadimagesucces extends ImageState {
  final Uint8List imageurl;

  uploadimagesucces({required this.imageurl});
}
