import 'package:flutter/material.dart';

final class RouteErrorPage extends StatelessWidget {
  const RouteErrorPage({
    super.key,
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("AnaSayfaya Dön"),
            )
          ],
        ),
      ),
    );
  }
}