import 'package:bookia/Features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookia/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  CustomBookDetailsAppBar(),
                  BookDetailsSection(),
                  Expanded(child: SizedBox(height: 50)),
                  SimilarBooksSection(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
