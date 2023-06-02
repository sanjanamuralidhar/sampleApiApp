import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 250),
        child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(strokeWidth: 4)),
      ),
    );
  }
}
