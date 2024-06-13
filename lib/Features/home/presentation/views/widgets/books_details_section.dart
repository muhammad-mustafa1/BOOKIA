import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:bookia/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookia/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: CustomBookImage(
              imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? '',
            )),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo!.title ?? '',
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
            opacity: .7,
            child: Text(bookModel.volumeInfo!.authors?.toString() ?? '',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ))),
        const SizedBox(height: 18),
        const BookRating(
          rating: 0,
          ratingCount: 0,
        ),
        const SizedBox(height: 37),
        BookAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
