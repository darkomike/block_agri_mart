import 'package:go_router/go_router.dart';

import '../../presentation/pages/pages.dart';

final homeRouter = GoRoute(
    name: 'home', path: '/', 
    
    builder: (context, state) => const HomePage());
