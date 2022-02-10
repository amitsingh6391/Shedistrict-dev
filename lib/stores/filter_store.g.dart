// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on FilterStoreBase, Store {
  Computed<Map<dynamic, dynamic>>? _$filteredUsersComputed;

  @override
  Map<dynamic, dynamic> get filteredUsers => (_$filteredUsersComputed ??=
          Computed<Map<dynamic, dynamic>>(() => super.filteredUsers,
              name: 'FilterStoreBase.filteredUsers'))
      .value;
  Computed<Map<dynamic, dynamic>>? _$currentFiltersComputed;

  @override
  Map<dynamic, dynamic> get currentFilters => (_$currentFiltersComputed ??=
          Computed<Map<dynamic, dynamic>>(() => super.currentFilters,
              name: 'FilterStoreBase.currentFilters'))
      .value;

  final _$_filteredUsersAtom = Atom(name: 'FilterStoreBase._filteredUsers');

  @override
  Map<dynamic, dynamic> get _filteredUsers {
    _$_filteredUsersAtom.reportRead();
    return super._filteredUsers;
  }

  @override
  set _filteredUsers(Map<dynamic, dynamic> value) {
    _$_filteredUsersAtom.reportWrite(value, super._filteredUsers, () {
      super._filteredUsers = value;
    });
  }

  final _$_currentFiltersAtom = Atom(name: 'FilterStoreBase._currentFilters');

  @override
  Map<dynamic, dynamic> get _currentFilters {
    _$_currentFiltersAtom.reportRead();
    return super._currentFilters;
  }

  @override
  set _currentFilters(Map<dynamic, dynamic> value) {
    _$_currentFiltersAtom.reportWrite(value, super._currentFilters, () {
      super._currentFilters = value;
    });
  }

  final _$getCurrentFiltersAsyncAction =
      AsyncAction('FilterStoreBase.getCurrentFilters');

  @override
  Future<dynamic> getCurrentFilters(dynamic userId) {
    return _$getCurrentFiltersAsyncAction
        .run(() => super.getCurrentFilters(userId));
  }

  final _$updateFiltersAsyncAction =
      AsyncAction('FilterStoreBase.updateFilters');

  @override
  Future<dynamic> updateFilters(dynamic userId, dynamic payload) {
    return _$updateFiltersAsyncAction
        .run(() => super.updateFilters(userId, payload));
  }

  final _$getUsersAsyncAction = AsyncAction('FilterStoreBase.getUsers');

  @override
  Future<dynamic> getUsers(dynamic filters) {
    return _$getUsersAsyncAction.run(() => super.getUsers(filters));
  }

  @override
  String toString() {
    return '''
filteredUsers: ${filteredUsers},
currentFilters: ${currentFilters}
    ''';
  }
}
