import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  @JsonKey(
    name: 'name',
  )
  final String? foodName;
  @JsonKey(
    name: 'cuisine',
  )
  final String? cuisineName;
  @JsonKey(
    name: 'image',
  )
  final String? imageURL;

  Food({this.foodName, this.cuisineName, this.imageURL});

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
