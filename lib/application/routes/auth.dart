import 'package:go_router/go_router.dart';

import '../../presentation/presentation.dart';

final authRouter = GoRoute(
    name: 'auth', path: '/auth', builder: (context, state) => const AuthPage());
