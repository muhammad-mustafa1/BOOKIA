import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key, this.width, this.height});

  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ));
  }
}

class FeaturedBooksShimmerLoadingItem extends StatelessWidget {
  const FeaturedBooksShimmerLoadingItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      child: const AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ShimmerItem(),
      ),
    );
  }
}

class NewestBooksShimmerLoadingItem extends StatelessWidget {
  const NewestBooksShimmerLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey.shade300,
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const AspectRatio(
              aspectRatio: 2.6 / 4,
              child: ShimmerItem(),
            ),
            const SizedBox(width: 30),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                ShimmerItem(
                    height: 12, width: MediaQuery.sizeOf(context).width * 0.5),
                const SizedBox(height: 16),
                ShimmerItem(
                    height: 12, width: MediaQuery.sizeOf(context).width * 0.7),
                const SizedBox(height: 16),
                ShimmerItem(
                    height: 12, width: MediaQuery.sizeOf(context).width * 0.3),
                const SizedBox(height: 16),
                ShimmerItem(
                    height: 12, width: MediaQuery.sizeOf(context).width * 0.1),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
