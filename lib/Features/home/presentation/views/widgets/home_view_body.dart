import 'package:bookia/Core/Utils/styles.dart';
import 'package:bookia/Core/assets.dart';
import 'package:bookia/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookia/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        SizedBox(height: 40),
        Text('Best Seller', style: Styles.textStyle18),
        BestSellerListViewItem()
      ],
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.bookImage),
                ),
              ),
            ),
          ),
          const Column(
            children: [],
          )
        ],
      ),
    );
  }
}
