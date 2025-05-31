import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureB extends StatelessWidget {
  const FeatureB({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),

        body: Column(
          children: [
            Center(child: Text('Feature B')),
            ElevatedButton(onPressed: () => context.goNamed('feature-c'), child: Text('Go to Feature C')),
            //
          ],
        ),
      ),
    );
  }
}
