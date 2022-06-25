import 'package:block_agri_mart/domain/notifications/routes/notifications.dart';
import 'package:block_agri_mart/domain/home/views/home.dart';
import 'package:block_agri_mart/domain/profile/routes/profile.dart';
import 'package:go_router/go_router.dart';

final homeRouter = GoRoute(
    name: 'home', path: '/', 
    routes: [profileRouter,notificationsRouter ],
    builder: (context, state) => const HomePage())
    
    ;
