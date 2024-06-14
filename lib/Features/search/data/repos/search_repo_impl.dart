import 'package:bookia/Core/Utils/api_service.dart';
import 'package:bookia/Core/errors/failures.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks() async {
    try {
      var data = await apiService.get(endPoint: 'volumes?q=flutter');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
