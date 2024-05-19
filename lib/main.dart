import 'package:easy_bazar/entities/user.dart';
import 'package:easy_bazar/ui/admin_page.dart';
import 'package:easy_bazar/ui/home_screen.dart';
import 'package:easy_bazar/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/adminPage',
      builder: (context, state) {
        AdminModel admin = state.extra as AdminModel;
        return AdminPage(
          adminModel: admin,
        );
      },
    ),
  ],
);
