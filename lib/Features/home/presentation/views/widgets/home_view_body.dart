import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookia/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookia/Features/home/presentation/views/widgets/best_seller_list_view.dart';
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
      child: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
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
                // BestSellerListView(),
              ],
            ),
          ),
          SliverFillRemaining(
            // use nested list view and scroll without shrink wrap
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: BestSellerListView(),
            ),
          )
        ],
      ),
    );
  }

  onRefresh(BuildContext context) {
    BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
    BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks();
  }
}
