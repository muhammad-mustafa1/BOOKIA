import 'package:bookia/Core/Utils/app_router.dart';
import 'package:bookia/Core/widgets/custom_error_widget.dart';
import 'package:bookia/Core/widgets/custom_loading_indicator.dart';
import 'package:bookia/Features/home/presentation/manager/similler_books_cubit/similler_books_cubit.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimillerBooksCubit, SimillerBooksState>(
      builder: (context, state) {
        if (state is SimillerBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.bookDetailsView,
                      extra: state.books[index]);
                },
                child: CustomBookImage(
                  imageUrl:
                      state.books[index].volumeInfo!.imageLinks?.thumbnail ??
                          '',
                ),
              ),
            ),
          );
        } else if (state is SimillerBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    const FeaturedBooksShimmerLoadingItem(),
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: 10),
          );
        }
      },
    );
  }
}
