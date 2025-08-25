import 'package:flutter/material.dart';

class U extends StatelessWidget {
  const U({Key? key}) : super(key: key);

  @override
  StatelessElement createElement() {
    // TODO: implement createElement
    print("stateless a - create element");
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    print("statelss u - build element");
    return Container();
  }
}
