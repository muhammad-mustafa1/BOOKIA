// كلاس يتم به تحديد الميثود التي يتم تنفيذها HomeRepo
// Either لانشاء ميثود ترجع اكثر من نوع
import 'package:bookia/Core/errors/failures.dart';
import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
