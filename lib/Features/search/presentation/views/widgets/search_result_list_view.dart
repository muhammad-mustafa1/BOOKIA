import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Core/widgets/custom_error_widget.dart';
import 'package:bookia/Core/widgets/custom_loading_indicator.dart';
import 'package:bookia/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookia/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
              child: Text(
            'Search here to get results',
            style: Styles.textStyle16,
          ));
        } else if (state is SearchSuccess) {
          return ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return BookListViewItem(bookModel: state.books[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: 10);
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
