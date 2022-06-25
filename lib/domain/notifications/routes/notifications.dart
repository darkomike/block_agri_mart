import 'package:go_router/go_router.dart';
import '../views/notification.dart';

final notificationsRouter = GoRoute(
    name: 'notifications',
    path: 'notifications',
    builder: (context, state) => const NotificationPage());
