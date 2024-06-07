part of 'fearured_books_cubit.dart';

abstract class FearuredBooksState extends Equatable {
  const FearuredBooksState();

  @override
  List<Object> get props => [];
}

class FearuredBooksInitial extends FearuredBooksState {}

class FearuredBooksLoading extends FearuredBooksState {}

class FearuredBooksFailure extends FearuredBooksState {
  final String errorMessage;
  const FearuredBooksFailure({required this.errorMessage});
}

class FearuredBooksSuccess extends FearuredBooksState {
  final List<BookModel> books;
  const FearuredBooksSuccess({required this.books});
}
