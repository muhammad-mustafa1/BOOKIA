import 'package:bookia/Core/Utils/functions/launch_url.dart';
import 'package:bookia/Core/widgets/custom_button.dart';
import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () {},
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                await launchCustomUrl(
                    context, bookModel.volumeInfo!.previewLink);
              },
              text: getText(bookModel),
              backgroundColor: const Color(0xffef8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel book) {
    if (book.volumeInfo!.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}
