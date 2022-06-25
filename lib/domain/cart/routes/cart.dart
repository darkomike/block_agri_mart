import 'package:block_agri_mart/domain/cart/views/cart.dart';
import 'package:go_router/go_router.dart';



final cartRouter = GoRoute(
    name: 'cart',
    path: 'cart',
    builder: (context, state) => const CartScreen());
