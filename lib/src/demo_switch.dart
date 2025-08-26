import 'package:demo/src/change%20lifecycle/a.dart';
import 'package:demo/src/demo-audio/demo-audio.dart';
import 'package:demo/src/demo-fonts/demo-font.dart';
import 'package:demo/src/demo-video/demo-video.dart';
import 'package:demo/src/demo_images/demo_images.dart';
import 'package:demo/src/demo-intl/intel.dart';
import 'package:demo/src/manage_app_cycle/manage_app_cycle.dart';
import 'package:demo/src/statefull.dart';
import 'package:demo/src/variable_lifecycle_in_statefull/var.dart';
import 'package:flutter/material.dart';

navigatePage(BuildContext context, Widget location) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(builder: (context) => location),
  );
}

class DemoSwitch extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onChanged;
  const DemoSwitch({super.key, required this.isDark, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo App", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                navigatePage(context, Statefull());
              },
              child: const Text("Demo statefull and stateless"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, A());
              },
              child: const Text("Demo about lifecycle of widgets"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, Var());
              },
              child: const Text("Demo about varibles"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, Intel());
              },
              child: const Text("Demo about internationalizing"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, AppLifecycleListenerExample());
              },
              child: const Text("Demo about manage LifeCycle"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, DemoFont());
              },
              child: const Text("Demo about fonts"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, DemoImages());
              },
              child: const Text("Demo about images"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, DemoAudio());
              },
              child: const Text("Demo Audio"),
            ),
            ElevatedButton(
              onPressed: () {
                navigatePage(context, DemoVideo());
              },
              child: const Text("Demo about Video"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onChanged(!isDark);
        },
        child: Icon(isDark ? Icons.dark_mode : Icons.light),
      ),
    );
  }
}
