import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_project/core/utils/keyboard_dismiss.dart';
import 'package:pokemon_project/modules/main_module.dart';
import 'package:sizer/sizer.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: Sizer(
        builder: (context, orientation, deviceType) => ModularApp(
          module: MainModule(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Pokémon List',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routerDelegate: Modular.routerDelegate,
            routeInformationParser: Modular.routeInformationParser,
          ),
        ),
      ),
    );
  }
}
