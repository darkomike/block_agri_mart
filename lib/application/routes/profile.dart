import 'package:block_agri_mart/presentation/pages/profile.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final profileRouter = GoRoute(
    name: 'profile',
    path: 'profile',
    builder: (context, state) => const ProfilePage());
