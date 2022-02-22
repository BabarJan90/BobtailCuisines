// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      foodName: json['name'] as String?,
      cuisineName: json['cuisine'] as String?,
      imageURL: json['image'] as String?,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'name': instance.foodName,
      'cuisine': instance.cuisineName,
      'image': instance.imageURL,
    };
