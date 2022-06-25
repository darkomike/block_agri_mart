import 'package:block_agri_mart/domain/products/views/products.dart';
import 'package:block_agri_mart/domain/requests/views/requests.dart';
import 'package:go_router/go_router.dart';



final productsRouter = GoRoute(
    name: 'products',
    path: 'products',
    builder: (context, state) => const ProductsScreen());
