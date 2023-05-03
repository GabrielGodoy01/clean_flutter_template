// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllUsersController on GetAllUsersControllerBase, Store {
  late final _$stateAtom =
      Atom(name: 'GetAllUsersControllerBase.state', context: context);

  @override
  GetAllUsersState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GetAllUsersState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getAllUsersAsyncAction =
      AsyncAction('GetAllUsersControllerBase.getAllUsers', context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  late final _$GetAllUsersControllerBaseActionController =
      ActionController(name: 'GetAllUsersControllerBase', context: context);

  @override
  dynamic setPageState(GetAllUsersState value) {
    final _$actionInfo = _$GetAllUsersControllerBaseActionController
        .startAction(name: 'GetAllUsersControllerBase.setPageState');
    try {
      return super.setPageState(value);
    } finally {
      _$GetAllUsersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
