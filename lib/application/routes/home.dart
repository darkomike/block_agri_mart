import 'package:block_agri_mart/application/routes/notifications.dart';
import 'package:block_agri_mart/application/routes/profile.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final homeRouter = GoRoute(
    name: 'home', path: '/', 
    routes: [profileRouter,notificationsRouter ],
    builder: (context, state) => const HomePage())
    
    ;
