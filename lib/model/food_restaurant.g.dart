// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodRestaurant _$FoodRestaurantFromJson(Map<String, dynamic> json) {
  return FoodRestaurant()
    ..imageUrl = json['imageUrl'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..phone = json['phone'] as String
    ..rating = json['rating'] as String
    ..address = json['address'] as String
    ..items = (json['items'] as List)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$FoodRestaurantToJson(FoodRestaurant instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'rating': instance.rating,
      'address': instance.address,
      'items': instance.items,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FoodRestaurant on _FoodRestaurant, Store {
  final _$imageUrlAtom = Atom(name: '_FoodRestaurant.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.context.enforceReadPolicy(_$imageUrlAtom);
    _$imageUrlAtom.reportObserved();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.context.conditionallyRunInAction(() {
      super.imageUrl = value;
      _$imageUrlAtom.reportChanged();
    }, _$imageUrlAtom, name: '${_$imageUrlAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_FoodRestaurant.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$descriptionAtom = Atom(name: '_FoodRestaurant.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$phoneAtom = Atom(name: '_FoodRestaurant.phone');

  @override
  String get phone {
    _$phoneAtom.context.enforceReadPolicy(_$phoneAtom);
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.context.conditionallyRunInAction(() {
      super.phone = value;
      _$phoneAtom.reportChanged();
    }, _$phoneAtom, name: '${_$phoneAtom.name}_set');
  }

  final _$ratingAtom = Atom(name: '_FoodRestaurant.rating');

  @override
  String get rating {
    _$ratingAtom.context.enforceReadPolicy(_$ratingAtom);
    _$ratingAtom.reportObserved();
    return super.rating;
  }

  @override
  set rating(String value) {
    _$ratingAtom.context.conditionallyRunInAction(() {
      super.rating = value;
      _$ratingAtom.reportChanged();
    }, _$ratingAtom, name: '${_$ratingAtom.name}_set');
  }

  final _$addressAtom = Atom(name: '_FoodRestaurant.address');

  @override
  String get address {
    _$addressAtom.context.enforceReadPolicy(_$addressAtom);
    _$addressAtom.reportObserved();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.context.conditionallyRunInAction(() {
      super.address = value;
      _$addressAtom.reportChanged();
    }, _$addressAtom, name: '${_$addressAtom.name}_set');
  }

  final _$itemsAtom = Atom(name: '_FoodRestaurant.items');

  @override
  List<Product> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(List<Product> value) {
    _$itemsAtom.context.conditionallyRunInAction(() {
      super.items = value;
      _$itemsAtom.reportChanged();
    }, _$itemsAtom, name: '${_$itemsAtom.name}_set');
  }
}
