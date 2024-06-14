import 'package:bookia/Core/errors/failures.dart';
import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks();
}
