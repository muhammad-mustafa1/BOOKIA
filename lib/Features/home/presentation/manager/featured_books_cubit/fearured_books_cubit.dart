import 'package:bloc/bloc.dart';
import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'fearured_books_state.dart';

class FearuredBooksCubit extends Cubit<FearuredBooksState> {
  FearuredBooksCubit() : super(FearuredBooksInitial());
}
