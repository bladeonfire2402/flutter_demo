import 'package:flutter/material.dart';

class L extends StatefulWidget {
  const L({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  _LState createState() => _LState();
}

class _LState extends State<L> {
  @override
  void didUpdateWidget(covariant L oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdatewidget L - ${widget.number}");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
