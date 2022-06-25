import 'package:block_agri_mart/application/application.dart';
import 'package:go_router/go_router.dart';
import '../state/state.dart';

final appRouter = GoRouter(
    initialLocation: '/auth',
    refreshListenable: appStateManager,
    urlPathStrategy: UrlPathStrategy.path,
    debugLogDiagnostics: false,
    routes: [homeRouter, authRouter],
    redirect: (state) {
      // if the user is not logged in, they need to login
      final loggedIn = appStateManager.loggedIn;
      final loggingIn = state.subloc == '/auth';
      if (!loggedIn) return loggingIn ? null : '/auth';

      // if the user is logged in but still on the login page, send them to
      // the home page
      if (loggingIn) return '/';

      // no need to redirect at all
      return null;
    },
    errorBuilder: (context, state) => const Page404());
