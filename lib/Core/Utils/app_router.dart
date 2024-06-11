import 'package:bookia/Core/Utils/service_locator.dart';
import 'package:bookia/Features/Splash/Presentation/Views/splash_view.dart';
import 'package:bookia/Features/home/Data/models/book_model/book_model.dart';
import 'package:bookia/Features/home/Data/repos/home_repo_impl.dart';
import 'package:bookia/Features/home/presentation/manager/similler_books_cubit/similler_books_cubit.dart';
import 'package:bookia/Features/home/presentation/views/book_details_view.dart';
import 'package:bookia/Features/home/presentation/views/home_view.dart';
import 'package:bookia/Features/search/presentation/views/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const splashView = '/';
  static const homeView = '/homeView';
  static const bookDetailsView = '/bookDetailsView';
  static const searchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: bookDetailsView,
        builder: (context, state) => BlocProvider(
            create: (context) =>
                SimillerBooksCubit(homeRepo: getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              bookModel: state.extra as BookModel,
            )),
      ),
    ],
  );
}
