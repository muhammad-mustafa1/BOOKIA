import 'package:bloc/bloc.dart';
import 'package:bookia/Core/Utils/functions/check_internet_connection.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.searchRepo}) : super(SearchInitial());

  final SearchRepo searchRepo;
  Future<void> getBooks({required String query}) async {
    if (!await checkInternetConnection()) {
      emit(const SearchFailure(errorMessage: 'No Internet Connection'));
      return;
    }
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(query: query);
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
