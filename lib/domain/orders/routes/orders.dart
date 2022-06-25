import 'package:block_agri_mart/domain/orders/views/orders.dart';
import 'package:go_router/go_router.dart';



final ordersRouter = GoRoute(
    name: 'orders',
    path: 'orders',
    builder: (context, state) => const OrdersScreen());
