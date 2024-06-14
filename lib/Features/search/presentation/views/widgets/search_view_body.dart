import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookia/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookia/Features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onSubmitted: (value) {
              BlocProvider.of<SearchCubit>(context).getBooks(query: value);
            },
          ),
          const SizedBox(height: 16),
          const Text('Search Result', style: Styles.textStyle18),
          const SizedBox(height: 16),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
