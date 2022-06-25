import 'package:block_agri_mart/domain/cart/routes/cart.dart';
import 'package:block_agri_mart/domain/notifications/routes/notifications.dart';
import 'package:block_agri_mart/domain/home/views/home.dart';
import 'package:block_agri_mart/domain/orders/routes/orders.dart';
import 'package:block_agri_mart/domain/products/routes/products.dart';
import 'package:block_agri_mart/domain/profile/routes/profile.dart';
import 'package:block_agri_mart/domain/requests/routes/requests.dart';
import 'package:block_agri_mart/domain/transactions/routes/transactions.dart';
import 'package:go_router/go_router.dart';

final homeRouter = GoRoute(
    name: 'home', path: '/', 
    routes: [profileRouter,notificationsRouter, ordersRouter, transactionsRouter, requestsRouter, productsRouter, cartRouter ],
    builder: (context, state) => const HomeScreen())
    
    ;
