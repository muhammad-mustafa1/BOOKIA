import 'package:bookia/Core/widgets/custom_error_widget.dart';
import 'package:bookia/Core/widgets/custom_loading_indicator.dart';
import 'package:bookia/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookia/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.separated(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BookListViewItem(
                bookModel: state.books[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 20),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) =>
                const NewestBooksShimmerLoadingItem(),
          );
        }
      },
    );
  }
}
