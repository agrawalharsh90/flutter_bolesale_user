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

  final _$loggedInUserAtom = Atom(name: '_UserStore.loggedInUser');

  @override
  LoggedInUser get loggedInUser {
    _$loggedInUserAtom.context.enforceReadPolicy(_$loggedInUserAtom);
    _$loggedInUserAtom.reportObserved();
    return super.loggedInUser;
  }

  @override
  set loggedInUser(LoggedInUser value) {
    _$loggedInUserAtom.context.conditionallyRunInAction(() {
      super.loggedInUser = value;
      _$loggedInUserAtom.reportChanged();
    }, _$loggedInUserAtom, name: '${_$loggedInUserAtom.name}_set');
  }

  final _$loginWithGoogleAsyncAction = AsyncAction('loginWithGoogle');

  @override
  Future loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$updatedUserAsyncAction = AsyncAction('updatedUser');

  @override
  Future updatedUser({LoggedInUser user, File imageFile}) {
    return _$updatedUserAsyncAction
        .run(() => super.updatedUser(user: user, imageFile: imageFile));
  }

  final _$createUserAsyncAction = AsyncAction('createUser');

  @override
  Future createUser(LoggedInUser user) {
    return _$createUserAsyncAction.run(() => super.createUser(user));
  }

  final _$setLoggedInAsyncAction = AsyncAction('setLoggedIn');

  @override
  Future setLoggedIn(LoggedInUser user) {
    return _$setLoggedInAsyncAction.run(() => super.setLoggedIn(user));
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }
}
