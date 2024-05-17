// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

sealed class FavoriteEvent {
  const FavoriteEvent();
}

class DocFavoriteEvent extends FavoriteEvent {
  final bool isFavorite;
  final String doctorid;
  DocFavoriteEvent({
    required this.isFavorite,
    required this.doctorid,
  });
}
