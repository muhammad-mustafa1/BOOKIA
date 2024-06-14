import 'package:bloc/bloc.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similler_books_state.dart';

class SimillerBooksCubit extends Cubit<SimillerBooksState> {
  SimillerBooksCubit({
    required this.homeRepo,
  }) : super(SimillerBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimillerBooks({required String category}) async {
    emit(SimillerBooksLoading());
    var result = await homeRepo.fetchSimillerBooks(category: category);
    result.fold(
      (failure) {
        emit(SimillerBooksFailure(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(SimillerBooksSuccess(books: books));
      },
    );
  }
}
