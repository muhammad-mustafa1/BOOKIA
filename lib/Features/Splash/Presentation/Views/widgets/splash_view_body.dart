import 'package:bookia/Core/Utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'B O O K I A',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    ));
  }

  void navigateToHome() {
    Future.delayed(
        const Duration(seconds: 3),
        () =>
            // Get.to(
            //   () => const HomeView(),
            //   transition: Transition.fadeIn,
            //   duration: kTransitionDuration,
            // ),

            GoRouter.of(context).push(AppRouter.homeView));
  }
}
