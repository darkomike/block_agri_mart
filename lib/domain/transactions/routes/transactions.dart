import 'package:block_agri_mart/domain/transactions/views/transactions.dart';
import 'package:go_router/go_router.dart';



final transactionsRouter = GoRoute(
    name: 'transactions',
    path: 'transactions',
    builder: (context, state) => const TransactionsScreen());
