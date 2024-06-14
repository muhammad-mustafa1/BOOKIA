import 'package:bookia/Core/models/book_model/book_model.dart';
import 'package:bookia/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookia/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  BookDetailsSection(
                    bookModel: bookModel,
                  ),
                  const Expanded(child: SizedBox(height: 50)),
                  const SimilarBooksSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
