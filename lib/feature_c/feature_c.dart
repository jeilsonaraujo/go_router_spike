import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureC extends StatelessWidget {
  const FeatureC({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),

        body: Column(
          children: [
            Center(child: Text('Feature C')),
            ElevatedButton(onPressed: () => context.goNamed('feature-a'), child: Text('Go to Feature A')),
            ElevatedButton(onPressed: () => context.goNamed('feature-d'), child: Text('Go to Feature D')),
            //
          ],
        ),
      ),
    );
  }
}
