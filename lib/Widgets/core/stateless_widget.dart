import 'package:flutter/material.dart';

class MeuStatelessWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;

  const MeuStatelessWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward),
        onTap: onPressed,
      ),
    );
  }
}
