import 'package:block_agri_mart/domain/requests/views/requests.dart';
import 'package:go_router/go_router.dart';



final requestsRouter = GoRoute(
    name: 'requests',
    path: 'requests',
    builder: (context, state) => const RequestsScreen());
