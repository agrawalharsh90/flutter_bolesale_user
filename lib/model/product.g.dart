// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product()
    ..sellerId = json['Id'] as String
    ..brand = json['brand'] as String
    ..category = json['category'] as String
    ..description = json['description'] as String
    ..dispatch = json['dispatch'] as String
    ..material = json['material'] as String
    ..moq = json['moq'] as String
    ..mrp = json['mrp'] as String
    ..origin = json['origin'] as String
    ..price = json['price'] as String
    ..product = json['product'] as String
    ..productID = json['productID'] as String
    ..stock = json['stock'] as String
    ..size = json['size'] as String
    ..sub_category = json['sub_category'] as String
    ..warranty = json['warranty'] as String
    ..quantity = json['quantity'] as int
    ..productImage =
        (json['productImage'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'Id': instance.sellerId,
      'brand': instance.brand,
      'category': instance.category,
      'description': instance.description,
      'dispatch': instance.dispatch,
      'material': instance.material,
      'moq': instance.moq,
      'mrp': instance.mrp,
      'origin': instance.origin,
      'price': instance.price,
      'product': instance.product,
      'productID': instance.productID,
      'stock': instance.stock,
      'size': instance.size,
      'sub_category': instance.sub_category,
      'warranty': instance.warranty,
      'quantity': instance.quantity,
      'productImage': instance.productImage,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Product on _Product, Store {
  final _$sellerIdAtom = Atom(name: '_Product.sellerId');

  @override
  String get sellerId {
    _$sellerIdAtom.context.enforceReadPolicy(_$sellerIdAtom);
    _$sellerIdAtom.reportObserved();
    return super.sellerId;
  }

  @override
  set sellerId(String value) {
    _$sellerIdAtom.context.conditionallyRunInAction(() {
      super.sellerId = value;
      _$sellerIdAtom.reportChanged();
    }, _$sellerIdAtom, name: '${_$sellerIdAtom.name}_set');
  }

  final _$brandAtom = Atom(name: '_Product.brand');

  @override
  String get brand {
    _$brandAtom.context.enforceReadPolicy(_$brandAtom);
    _$brandAtom.reportObserved();
    return super.brand;
  }

  @override
  set brand(String value) {
    _$brandAtom.context.conditionallyRunInAction(() {
      super.brand = value;
      _$brandAtom.reportChanged();
    }, _$brandAtom, name: '${_$brandAtom.name}_set');
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

  final _$dispatchAtom = Atom(name: '_Product.dispatch');

  @override
  String get dispatch {
    _$dispatchAtom.context.enforceReadPolicy(_$dispatchAtom);
    _$dispatchAtom.reportObserved();
    return super.dispatch;
  }

  @override
  set dispatch(String value) {
    _$dispatchAtom.context.conditionallyRunInAction(() {
      super.dispatch = value;
      _$dispatchAtom.reportChanged();
    }, _$dispatchAtom, name: '${_$dispatchAtom.name}_set');
  }

  final _$materialAtom = Atom(name: '_Product.material');

  @override
  String get material {
    _$materialAtom.context.enforceReadPolicy(_$materialAtom);
    _$materialAtom.reportObserved();
    return super.material;
  }

  @override
  set material(String value) {
    _$materialAtom.context.conditionallyRunInAction(() {
      super.material = value;
      _$materialAtom.reportChanged();
    }, _$materialAtom, name: '${_$materialAtom.name}_set');
  }

  final _$moqAtom = Atom(name: '_Product.moq');

  @override
  String get moq {
    _$moqAtom.context.enforceReadPolicy(_$moqAtom);
    _$moqAtom.reportObserved();
    return super.moq;
  }

  @override
  set moq(String value) {
    _$moqAtom.context.conditionallyRunInAction(() {
      super.moq = value;
      _$moqAtom.reportChanged();
    }, _$moqAtom, name: '${_$moqAtom.name}_set');
  }

  final _$mrpAtom = Atom(name: '_Product.mrp');

  @override
  String get mrp {
    _$mrpAtom.context.enforceReadPolicy(_$mrpAtom);
    _$mrpAtom.reportObserved();
    return super.mrp;
  }

  @override
  set mrp(String value) {
    _$mrpAtom.context.conditionallyRunInAction(() {
      super.mrp = value;
      _$mrpAtom.reportChanged();
    }, _$mrpAtom, name: '${_$mrpAtom.name}_set');
  }

  final _$originAtom = Atom(name: '_Product.origin');

  @override
  String get origin {
    _$originAtom.context.enforceReadPolicy(_$originAtom);
    _$originAtom.reportObserved();
    return super.origin;
  }

  @override
  set origin(String value) {
    _$originAtom.context.conditionallyRunInAction(() {
      super.origin = value;
      _$originAtom.reportChanged();
    }, _$originAtom, name: '${_$originAtom.name}_set');
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

  final _$productAtom = Atom(name: '_Product.product');

  @override
  String get product {
    _$productAtom.context.enforceReadPolicy(_$productAtom);
    _$productAtom.reportObserved();
    return super.product;
  }

  @override
  set product(String value) {
    _$productAtom.context.conditionallyRunInAction(() {
      super.product = value;
      _$productAtom.reportChanged();
    }, _$productAtom, name: '${_$productAtom.name}_set');
  }

  final _$productIDAtom = Atom(name: '_Product.productID');

  @override
  String get productID {
    _$productIDAtom.context.enforceReadPolicy(_$productIDAtom);
    _$productIDAtom.reportObserved();
    return super.productID;
  }

  @override
  set productID(String value) {
    _$productIDAtom.context.conditionallyRunInAction(() {
      super.productID = value;
      _$productIDAtom.reportChanged();
    }, _$productIDAtom, name: '${_$productIDAtom.name}_set');
  }

  final _$stockAtom = Atom(name: '_Product.stock');

  @override
  String get stock {
    _$stockAtom.context.enforceReadPolicy(_$stockAtom);
    _$stockAtom.reportObserved();
    return super.stock;
  }

  @override
  set stock(String value) {
    _$stockAtom.context.conditionallyRunInAction(() {
      super.stock = value;
      _$stockAtom.reportChanged();
    }, _$stockAtom, name: '${_$stockAtom.name}_set');
  }

  final _$sizeAtom = Atom(name: '_Product.size');

  @override
  String get size {
    _$sizeAtom.context.enforceReadPolicy(_$sizeAtom);
    _$sizeAtom.reportObserved();
    return super.size;
  }

  @override
  set size(String value) {
    _$sizeAtom.context.conditionallyRunInAction(() {
      super.size = value;
      _$sizeAtom.reportChanged();
    }, _$sizeAtom, name: '${_$sizeAtom.name}_set');
  }

  final _$sub_categoryAtom = Atom(name: '_Product.sub_category');

  @override
  String get sub_category {
    _$sub_categoryAtom.context.enforceReadPolicy(_$sub_categoryAtom);
    _$sub_categoryAtom.reportObserved();
    return super.sub_category;
  }

  @override
  set sub_category(String value) {
    _$sub_categoryAtom.context.conditionallyRunInAction(() {
      super.sub_category = value;
      _$sub_categoryAtom.reportChanged();
    }, _$sub_categoryAtom, name: '${_$sub_categoryAtom.name}_set');
  }

  final _$warrantyAtom = Atom(name: '_Product.warranty');

  @override
  String get warranty {
    _$warrantyAtom.context.enforceReadPolicy(_$warrantyAtom);
    _$warrantyAtom.reportObserved();
    return super.warranty;
  }

  @override
  set warranty(String value) {
    _$warrantyAtom.context.conditionallyRunInAction(() {
      super.warranty = value;
      _$warrantyAtom.reportChanged();
    }, _$warrantyAtom, name: '${_$warrantyAtom.name}_set');
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

  final _$productImageAtom = Atom(name: '_Product.productImage');

  @override
  List<String> get productImage {
    _$productImageAtom.context.enforceReadPolicy(_$productImageAtom);
    _$productImageAtom.reportObserved();
    return super.productImage;
  }

  @override
  set productImage(List<String> value) {
    _$productImageAtom.context.conditionallyRunInAction(() {
      super.productImage = value;
      _$productImageAtom.reportChanged();
    }, _$productImageAtom, name: '${_$productImageAtom.name}_set');
  }
}
