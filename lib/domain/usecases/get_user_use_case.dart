import 'dart:async';

import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_use_case.dart';
import 'package:flutter_getx_base/utils/cores/pair.dart';

class GetUserUseCase extends UseCase<Pair<List<UserModel>?, int>, GetUserInput> {
  GetUserUseCase(this.userRepositoryImpl);

  final UserRepositoryImpl userRepositoryImpl;

  @override
  Future<Pair<List<UserModel>?, int>> buildUseCase(GetUserInput? input) {
    return userRepositoryImpl.getUsers(input!.page);
  }
}

class GetUserInput {
  GetUserInput(this.page);

  int? page = 1;
}
