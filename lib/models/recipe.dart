import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';

enum Lvl { simple, normal, hard }
enum Price { lowcost, medium, rich }

@freezed
class Ricepe with _$Ricepe {
  const factory Ricepe({
    required String id,
    required List<String> categories,
    required String title,
    required String imageUrl,
    required List<String> ingredients,
    required List<String> steps,
    required int duration,
    required Lvl lvl,
    required Price price,
    required bool isGlutenFree,
    required bool isLactoseFree,
    required bool isVegan,
    required bool isVegetarian,
  }) = _Ricepe;
}
