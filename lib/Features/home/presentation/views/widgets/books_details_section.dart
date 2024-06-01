import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookia/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: const CustomBookImage()),
        const SizedBox(height: 43),
        const Text('The Jungle Book', style: Styles.textStyle30),
        const SizedBox(height: 6),
        Opacity(
            opacity: .7,
            child: Text('Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ))),
        const SizedBox(height: 18),
        const BookRating(),
        const SizedBox(height: 37),
        const BookAction(),
      ],
    );
  }
}
