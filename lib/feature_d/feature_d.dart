import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureD extends StatelessWidget {
  const FeatureD({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),

        body: Column(
          children: [
            Center(child: Text('Feature D')),
            ElevatedButton(onPressed: () => context.goNamed('feature-a'), child: Text('Go to Feature A')),
            //
          ],
        ),
      ),
    );
  }
}
