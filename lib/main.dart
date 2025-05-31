import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_spike/feature_a/feature_a.dart';
import 'package:go_router_spike/feature_b/feature_b.dart';
import 'package:go_router_spike/feature_c/feature_c.dart';
import 'package:go_router_spike/feature_d/feature_d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,

      //
    );
  }
}

final routeObserver = RouteObserver<ModalRoute<void>>();
get routerConfig => GoRouter(
  observers: [routeObserver],
  initialLocation: '/feature-a',
  routes: [
    GoRoute(
      name: 'feature-a',
      path: '/feature-a',
      builder: (context, state) => const FeatureA(),
      routes: [
        GoRoute(
          name: 'feature-b',
          path: 'feature-b',
          builder: (context, state) => const FeatureB(),
          routes: [
            GoRoute(
              name: 'feature-c',
              path: 'feature-c',
              builder: (context, state) => const FeatureC(),
              //
            ),
          ],
          //
        ),
      ],
      //
    ),
    GoRoute(name: 'feature-d', path: '/feature-d', builder: (context, state) => const FeatureD()),
  ],
);
