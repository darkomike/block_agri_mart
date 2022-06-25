import 'package:go_router/go_router.dart';

import '../views/profile.dart';


final profileRouter = GoRoute(
    name: 'profile',
    path: 'profile',
    builder: (context, state) => const ProfileScreen());
