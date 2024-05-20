import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final user = FirebaseAuth.instance.currentUser;
  FavoriteBloc() : super(FavoriteInitial()) {
    on<DocFavoriteEvent>((event, emit) {
      try {
        if (event.isFavorite) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(user!.uid)
              .collection("favorite")
              .doc(event.doctorid)
              .set({'docid': event.doctorid});
          emit(DocFavoriteSuccessState());
        } else {
          FirebaseFirestore.instance
              .collection("users")
              .doc(user!.uid)
              .collection("favorite")
              .doc(event.doctorid)
              .delete();
          emit(DocFavoriteSuccessState());
        }
      } catch (e) {
        emit(DocFavoriteErrorState());
      }
    });
  }
}
