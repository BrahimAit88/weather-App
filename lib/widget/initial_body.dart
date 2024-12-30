import 'package:flutter/material.dart';

class InitialBady extends StatelessWidget {
  const InitialBady({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😌 start ',
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            Text(
              'searching 🔍 now ',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
