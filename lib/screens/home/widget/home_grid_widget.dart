import 'package:flutter/material.dart';

class HomeGridWidget extends StatelessWidget {
  final String title;
  final String value;
  final String unit;

  const HomeGridWidget({
    Key? key,
    required this.title,
    required this.value,
    this.unit = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 3,
      margin: EdgeInsets.all(4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.blue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 1,
            ),
            SizedBox(height: 4),
            RichText(
              maxLines: 1,
              text: TextSpan(
                children: [
                  TextSpan(text: value),
                  if (unit.isNotEmpty) TextSpan(text: ' $unit'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
