import 'package:bloc/bloc.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> getBooks(String query) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks();
    result.fold(
      (failure) {
        emit(
          SearchFailure(errorMessage: failure.errorMessage),
        );
      },
      (books) {
        emit(SearchSuccess(books: books));
      },
    );
  }
}
