import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const Category._();
  const factory Category({
    required String id,
    required String title,
    @Default(Colors.orange) Color color,
  }) = _Category;
}
