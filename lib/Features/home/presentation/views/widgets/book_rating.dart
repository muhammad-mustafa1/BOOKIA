import 'package:bookia/Core/Utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  final num rating;
  final num ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 14,
        ),
        const SizedBox(width: 6.3),
        Text(
          rating.toString(),
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text('($ratingCount)', style: Styles.textStyle14),
        )
      ],
    );
  }
}
