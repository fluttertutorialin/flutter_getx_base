import 'package:flutter_getx_base/presentation/base_controller.dart';
import 'package:get/instance_manager.dart';

class AnimationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimationsController());
  }
}

class AnimationsController extends BaseController {}
