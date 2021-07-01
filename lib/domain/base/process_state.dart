import 'package:get/get.dart';

int inititalPage = 1;

class ProcessState<T> extends GetxController with StateMixin<T> {
  int? nextPage = inititalPage;
  T? data;

  ProcessState() {
    change(null, status: RxStatus.empty());
  }

  void onSuccess({T? data, int? nextPage}) {
    this.nextPage = nextPage;

    if (status.isLoadingMore) {
      change(((value as List<dynamic>) + (data as List<dynamic>) as T),
          status: RxStatus.success());
    } else {
      change(data, status: RxStatus.success());
    }
  }

  void onError(String? message) {
    change(null, status: RxStatus.error(message));
  }

  void onLoading() {
    if (nextPage! > inititalPage) {
      change(value, status: RxStatus.loadingMore());
    } else {
      change(null, status: RxStatus.loading());
    }
  }

  void onRefreshing() {
    nextPage = inititalPage;
    data = null;
    change(null, status: RxStatus.empty());
  }
}
