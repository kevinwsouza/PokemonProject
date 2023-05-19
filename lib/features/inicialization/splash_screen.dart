import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pokemon_project/modules/main_module.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _loadAppSettings() async {
    await Modular.isModuleReady<MainModule>();
    Modular.to.pushNamed('/home-screen');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    _loadAppSettings();
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
