import 'package:bookia/Core/widgets/custom_button.dart';
import 'package:bookia/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryButtonListView extends StatefulWidget {
  const CategoryButtonListView({super.key, required this.categoryList});
  final List<String> categoryList;

  @override
  State<CategoryButtonListView> createState() => _CategoryButtonListViewState();
}

class _CategoryButtonListViewState extends State<CategoryButtonListView> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150,
            child: CustomButton(
              onPressed: () async {
                setState(() {
                  currentindex = index;
                });
                await BlocProvider.of<NewestBooksCubit>(context)
                    .fetchNewestBooks(
                        category: widget.categoryList[index] == 'All'
                            ? '-'
                            : widget.categoryList[index]);
              },
              backgroundColor: currentindex == index
                  ? const Color(0xffef8262)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
              textColor: Colors.black,
              text: widget.categoryList[index],
            ),
          );
        });
  }
}
