import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final authRouter = GoRoute(
    name: 'auth', path: '/auth', builder: (context, state) => const AuthPage());
