part of 'favorite_bloc.dart';

sealed class FavoriteState {
  const FavoriteState();
 
}

final class FavoriteInitial extends FavoriteState {}
 
 class DocFavoriteSuccessState extends FavoriteState{
  
 }class DocFavoriteErrorState extends FavoriteState{
  
 }