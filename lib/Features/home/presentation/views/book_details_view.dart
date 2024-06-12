import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:bookia/Features/home/presentation/manager/similler_books_cubit/similler_books_cubit.dart';
import 'package:bookia/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimillerBooksCubit>(context).fetchSimillerBooks(
        category: widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsViewBody(
        bookModel: widget.bookModel,
      ),
    );
  }
}
