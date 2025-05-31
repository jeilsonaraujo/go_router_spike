import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_spike/main.dart';

class FeatureA extends StatefulWidget {
  const FeatureA({super.key});

  @override
  State<FeatureA> createState() => _FeatureAState();
}

class _FeatureAState extends State<FeatureA> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute is PageRoute) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Navigated back to FeatureA')));
    });
    debugPrint('Navigated back to FeatureA');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feature A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.goNamed('feature-b');
          },
          child: const Text('Ir para Feature B'),
        ),
      ),
    );
  }
}
