import 'package:go_router/go_router.dart';


import 'package:catbreeds_riverpod/domain/entities/breed_entity.dart';

import 'package:catbreeds_riverpod/config/router/app_routes.dart';

import 'package:catbreeds_riverpod/presentation/pages/breeds/breeds_page.dart';
import 'package:catbreeds_riverpod/presentation/pages/detail/detail_page.dart';



final appRouter = GoRouter(
  initialLocation: AppRoutesEnum.breeds.path,
  routes: [
    GoRoute(
      path: AppRoutesEnum.breeds.path,
      builder: (context, state) => const BreedsPage(),
    ),
    GoRoute(
      path: AppRoutesEnum.detail.path,
      builder: (context, state) {
        final paramBreed = state.extra as BreedEntity;

        return DetailPage(
          breed: paramBreed,
        );
      }
    )
  ],
  redirect: (context, state) {
    
    return null;
  },
);