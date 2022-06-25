import 'package:go_router/go_router.dart';
import '../views/auth.dart';

final authRouter = GoRoute(
    name: 'auth',
    path: '/auth',
    builder: (context, state) => const AuthScreen());
