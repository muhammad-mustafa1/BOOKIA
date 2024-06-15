import 'package:bloc/bloc.dart';
import 'package:bookia/Core/Utils/functions/check_internet_connection.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/home/Data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required this.homeRepo}) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async {
    if (!await checkInternetConnection()) {
      emit(const NewestBooksFailure(errorMessage: 'No Internet Connection'));
      return;
    }
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold(
      (failure) {
        emit(
          NewestBooksFailure(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }
}
