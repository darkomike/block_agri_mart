 import 'package:block_agri_mart/application/application.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final appRouter = GoRouter(
      initialLocation: '/auth',
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        authRouter,
        homeRouter
        
      ],
      errorBuilder: (context, state) => const  Page404()
      
      );
