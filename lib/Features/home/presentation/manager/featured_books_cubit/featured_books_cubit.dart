import 'package:bloc/bloc.dart';
import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:bookia/Features/home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FearuredBooksCubit extends Cubit<FeaturedBooksState> {
  FearuredBooksCubit(this.homeRepo)
      : super(
          FeaturedBooksInitial(),
        );
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(
          FeaturedBooksFailure(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
