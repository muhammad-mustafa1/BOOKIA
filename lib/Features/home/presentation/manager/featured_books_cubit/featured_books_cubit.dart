import 'package:bloc/bloc.dart';
import 'package:bookia/Core/Utils/functions/check_internet_connection.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.homeRepo})
      : super(
          FeaturedBooksInitial(),
        );
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    if (!await checkInternetConnection()) {
      emit(const FeaturedBooksFailure(errorMessage: 'No Internet Connection'));
      return;
    }
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
