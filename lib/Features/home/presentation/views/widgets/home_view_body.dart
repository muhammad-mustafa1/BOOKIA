import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookia/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookia/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:bookia/Features/home/presentation/views/widgets/category_button_list_view.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookia/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await onRefresh(context);
        return await Future.delayed(const Duration(seconds: 1));
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListView(),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Newest Books',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                      height: 40,
                      child: CategoryButtonListView(
                        categoryList: [
                          'All',
                          'sports',
                          'science',
                          'self help',
                          'food',
                          'business',
                          'history',
                          'art',
                          'motivation',
                          'biography',
                          'thriller',
                        ],
                      )),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: NewestBooksListView(),
              );
            },
          )),
        ],
      ),
    );
  }

  onRefresh(BuildContext context) {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(category: '');
  }
}
