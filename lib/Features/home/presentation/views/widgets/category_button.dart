import 'package:bookia/Core/widgets/custom_button.dart';
import 'package:bookia/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.categoryText,
  });
  final String categoryText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 130,
      child: CustomButton(
          onPressed: () async {
            await BlocProvider.of<NewestBooksCubit>(context)
                .fetchNewestBooks(category: categoryText);
          },
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(16),
          textColor: Colors.black,
          text: categoryText),
    );
  }
}
