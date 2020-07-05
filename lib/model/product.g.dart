// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product()
    ..id = json['id'] as int
    ..imageUrl = json['imageUrl'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..category = json['category'] as String
    ..city = json['city'] as String
    ..type = json['type'] as String
    ..quantity = json['quantity'] as int
    ..price = json['price'] as String;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'city': instance.city,
      'type': instance.type,
      'quantity': instance.quantity,
      'price': instance.price,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Product on _Product, Store {
  final _$idAtom = Atom(name: '_Product.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$imageUrlAtom = Atom(name: '_Product.imageUrl');

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

  final _$nameAtom = Atom(name: '_Product.name');

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

  final _$descriptionAtom = Atom(name: '_Product.description');

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

  final _$categoryAtom = Atom(name: '_Product.category');

  @override
  String get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$cityAtom = Atom(name: '_Product.city');

  @override
  String get city {
    _$cityAtom.context.enforceReadPolicy(_$cityAtom);
    _$cityAtom.reportObserved();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.context.conditionallyRunInAction(() {
      super.city = value;
      _$cityAtom.reportChanged();
    }, _$cityAtom, name: '${_$cityAtom.name}_set');
  }

  final _$typeAtom = Atom(name: '_Product.type');

  @override
  String get type {
    _$typeAtom.context.enforceReadPolicy(_$typeAtom);
    _$typeAtom.reportObserved();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.context.conditionallyRunInAction(() {
      super.type = value;
      _$typeAtom.reportChanged();
    }, _$typeAtom, name: '${_$typeAtom.name}_set');
  }

  final _$quantityAtom = Atom(name: '_Product.quantity');

  @override
  int get quantity {
    _$quantityAtom.context.enforceReadPolicy(_$quantityAtom);
    _$quantityAtom.reportObserved();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.context.conditionallyRunInAction(() {
      super.quantity = value;
      _$quantityAtom.reportChanged();
    }, _$quantityAtom, name: '${_$quantityAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_Product.price');

  @override
  String get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(String value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }
}
