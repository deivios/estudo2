import 'package:flutter/material.dart';

class MeuStatefulWidget extends StatefulWidget {
  final void Function() callback;
  
  const MeuStatefulWidget({
    super.key,
    required this.callback,
  });

  @override
  State<MeuStatefulWidget> createState() => _MeuStatefulWidgetState();
}

class _MeuStatefulWidgetState extends State<MeuStatefulWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
            widget.callback();
          },
          child: Text('Incrementar'),
        ),
      ],
    );
  }
}
