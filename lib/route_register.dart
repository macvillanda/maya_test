import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maya_test/features/account/presentation/pages/account_home_page.dart';
import 'package:maya_test/features/account/presentation/pages/send_amount_page.dart';
import 'package:maya_test/features/account/presentation/pages/transactions_page.dart';

class RouteRegister {
  final RouterConfig<Object> router = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (context, state) => const AccountHomePage()),
      GoRoute(
          path: '/send_amount', builder: (context, state) => SendAmountPage()),
      GoRoute(
          path: '/history', builder: (context, state) => TransactionsPage()),
    ],
  );
}
