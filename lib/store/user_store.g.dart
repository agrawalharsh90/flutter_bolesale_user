// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  final _$isLoadingAtom = Atom(name: '_UserStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$isLoggedInAtom = Atom(name: '_UserStore.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.context.enforceReadPolicy(_$isLoggedInAtom);
    _$isLoggedInAtom.reportObserved();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.context.conditionallyRunInAction(() {
      super.isLoggedIn = value;
      _$isLoggedInAtom.reportChanged();
    }, _$isLoggedInAtom, name: '${_$isLoggedInAtom.name}_set');
  }

  final _$isCodeSentAtom = Atom(name: '_UserStore.isCodeSent');

  @override
  bool get isCodeSent {
    _$isCodeSentAtom.context.enforceReadPolicy(_$isCodeSentAtom);
    _$isCodeSentAtom.reportObserved();
    return super.isCodeSent;
  }

  @override
  set isCodeSent(bool value) {
    _$isCodeSentAtom.context.conditionallyRunInAction(() {
      super.isCodeSent = value;
      _$isCodeSentAtom.reportChanged();
    }, _$isCodeSentAtom, name: '${_$isCodeSentAtom.name}_set');
  }

  final _$isCodeAutoReceivedAtom = Atom(name: '_UserStore.isCodeAutoReceived');

  @override
  bool get isCodeAutoReceived {
    _$isCodeAutoReceivedAtom.context
        .enforceReadPolicy(_$isCodeAutoReceivedAtom);
    _$isCodeAutoReceivedAtom.reportObserved();
    return super.isCodeAutoReceived;
  }

  @override
  set isCodeAutoReceived(bool value) {
    _$isCodeAutoReceivedAtom.context.conditionallyRunInAction(() {
      super.isCodeAutoReceived = value;
      _$isCodeAutoReceivedAtom.reportChanged();
    }, _$isCodeAutoReceivedAtom, name: '${_$isCodeAutoReceivedAtom.name}_set');
  }

  final _$loggedInUserAtom = Atom(name: '_UserStore.loggedInUser');

  @override
  User get loggedInUser {
    _$loggedInUserAtom.context.enforceReadPolicy(_$loggedInUserAtom);
    _$loggedInUserAtom.reportObserved();
    return super.loggedInUser;
  }

  @override
  set loggedInUser(User value) {
    _$loggedInUserAtom.context.conditionallyRunInAction(() {
      super.loggedInUser = value;
      _$loggedInUserAtom.reportChanged();
    }, _$loggedInUserAtom, name: '${_$loggedInUserAtom.name}_set');
  }

  final _$verfIdAtom = Atom(name: '_UserStore.verfId');

  @override
  String get verfId {
    _$verfIdAtom.context.enforceReadPolicy(_$verfIdAtom);
    _$verfIdAtom.reportObserved();
    return super.verfId;
  }

  @override
  set verfId(String value) {
    _$verfIdAtom.context.conditionallyRunInAction(() {
      super.verfId = value;
      _$verfIdAtom.reportChanged();
    }, _$verfIdAtom, name: '${_$verfIdAtom.name}_set');
  }

  final _$sendOTPAsyncAction = AsyncAction('sendOTP');

  @override
  Future sendOTP(
      {String phoneNumber,
      Function verificationFailed,
      Function verificationComplete}) {
    return _$sendOTPAsyncAction.run(() => super.sendOTP(
        phoneNumber: phoneNumber,
        verificationFailed: verificationFailed,
        verificationComplete: verificationComplete));
  }

  final _$verifyOTPAsyncAction = AsyncAction('verifyOTP');

  @override
  Future verifyOTP({String otp}) {
    return _$verifyOTPAsyncAction.run(() => super.verifyOTP(otp: otp));
  }

  final _$updatedUserAsyncAction = AsyncAction('updatedUser');

  @override
  Future updatedUser({User user, File imageFile}) {
    return _$updatedUserAsyncAction
        .run(() => super.updatedUser(user: user, imageFile: imageFile));
  }

  final _$createUserAsyncAction = AsyncAction('createUser');

  @override
  Future createUser(User user) {
    return _$createUserAsyncAction.run(() => super.createUser(user));
  }

  final _$setLoggedInAsyncAction = AsyncAction('setLoggedIn');

  @override
  Future setLoggedIn(User user) {
    return _$setLoggedInAsyncAction.run(() => super.setLoggedIn(user));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }
}
