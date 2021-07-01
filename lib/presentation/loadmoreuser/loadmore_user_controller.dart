import 'package:flutter_getx_base/data/remote/api/error/network_exception.dart';
import 'package:flutter_getx_base/domain/base/process_state.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/domain/usecases/base/base_observer.dart';
import 'package:flutter_getx_base/domain/usecases/get_user_use_case.dart';
import 'package:flutter_getx_base/presentation/base_controller.dart';
import 'package:flutter_getx_base/utils/config/app_route.dart';
import 'package:flutter_getx_base/utils/dilog/dialog.dart';
import 'package:get/get.dart';

class LoadmoreBinding extends Bindings {
  @override
  void dependencies() {
    // use lazy put or put to use singleton
    // Get.lazyPut(() => () => LoadmoreController(GetUserUseCase(Get.find())));

    // use create to use multiple instances
    Get.lazyPut(() => GetUserUseCase(Get.find()));
    Get.create(() => LoadmoreController(Get.find()));
  }
}

class LoadmoreController extends BaseController {
  LoadmoreController(this._getUserUseCase);

  final GetUserUseCase _getUserUseCase;

  final ProcessState<List<UserModel>> userListState = ProcessState();

  @override
  void onInit() {
    super.onInit();
    userListState.addListener(() async {
      if (userListState.status.isError) {
        bool? result =
            await showConfirmDialog(userListState.status.errorMessage!);
        print(result);
      }
    });
    getUserList();
  }

  Future<void> getUserList() async {
    print(userListState.nextPage);
    await _getUserUseCase.execute(
      observer: Observer(
        onSubscribe: () {
          userListState.onLoading();
        },
        onSuccess: (data) {
          userListState.onSuccess(data: data.first(), nextPage: data.second());
        },
        onError: (NetWorkException e) {
          userListState.onError(e.toString());
        },
      ),
      input: GetUserInput(userListState.nextPage),
    );
  }

  @override
  void dispose() {
    _getUserUseCase.dispose();
    userListState.dispose();
    super.dispose();
  }

  void goToLoadmore() {
    Get.toNamed(AppRoute.routeLoadmoreScreen(), preventDuplicates: false);
  }
}
