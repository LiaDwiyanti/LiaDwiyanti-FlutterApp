import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/providers/palindrom_provider.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final name = Provider.of<PalindromeProvider>(context).name;

    return Scaffold(
      body: Center(
        child: Text('Halo, $name'),
      ),
    );
  }
}