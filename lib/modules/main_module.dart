import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_project/core/client/pokemon_project_client.dart';
import 'package:pokemon_project/core/client/pokemon_project_impl.dart';
import 'package:pokemon_project/core/configuration.dart';
import 'package:pokemon_project/features/inicialization/splash_screen.dart';
import 'package:pokemon_project/features/pokemon_list/domain/entities/pokemon.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/screens/Details_Screen.dart';
import 'package:pokemon_project/features/pokemon_list/presentation/screens/home_screen.dart';
import 'package:pokemon_project/modules/pokemon_module.dart';

class MainModule extends Module {
  @override
  List<Module> get imports => [
        PokemonModule(),
      ];

  @override
  List<Bind> get binds => [
        Bind.factory<Dio>((i) {
          final dio = Dio(
            BaseOptions(
              connectTimeout: 5000,
              receiveTimeout: 50000,
            ),
          );
          return dio;
        }),
        Bind.factory<PokemonProjectClient>((i) => PokemonProjectDioClientImpl(
              client: i(),
              url: Configuration.baseUrl,
            )),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashScreen()),
        ChildRoute(
          '/home-screen',
          child: (context, args) => const HomeScreen(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/pokemon-details',
          child: (_, args) => DetailsScreen(args: args.data),
          transition: TransitionType.leftToRight,
        ),
      ];
}
