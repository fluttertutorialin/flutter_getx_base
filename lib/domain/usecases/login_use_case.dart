import 'package:flutter_getx_base/data/remote/api/request/login_request.dart';
import 'package:flutter_getx_base/data/user_repository_implement.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_use_case.dart';

class LoginUseCase extends UseCase<void, LoginInput> {
  LoginUseCase(this.userRepositoryImpl);

  final UserRepositoryImpl userRepositoryImpl;

  @override
  Future<void> buildUseCase(LoginInput? input) {
    return userRepositoryImpl.login(input!.toRequest());
  }
}

class LoginInput {
  LoginInput(this.username, this.password);
  final String username;
  final String password;
  final String grantType = 'password';

  LoginRequest toRequest() {
    return LoginRequest(grantType, username, password);
  }
}
