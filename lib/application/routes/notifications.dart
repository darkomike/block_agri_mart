import 'package:block_agri_mart/presentation/pages/notification.dart';
import 'package:block_agri_mart/presentation/pages/profile.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/pages.dart';

final notificationsRouter = GoRoute(
    name: 'notifications',
    path: 'notifications',
    builder: (context, state) => const NotificationPage());
