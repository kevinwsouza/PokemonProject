import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart' as dio;

class PokemonProjectResponse extends Equatable {
  final int? statusCode;
  final dynamic data;

  const PokemonProjectResponse({
    required this.statusCode,
    required this.data,
  });

  factory PokemonProjectResponse.fromDioResponse(dio.Response response) {
    return PokemonProjectResponse(
      statusCode: response.statusCode,
      data: response.data,
    );
  }

  bool get isSuccess =>
      statusCode != null && statusCode! >= 200 && statusCode! <= 299;
  bool get isError => !isSuccess;

  @override
  String toString() => 'Código: $statusCode\nData: $data';

  @override
  List<Object?> get props => [statusCode, data];
}
