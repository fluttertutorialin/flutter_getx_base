import 'package:flutter/material.dart';
import 'package:flutter_getx_base/presentation/home/home_controller.dart';
import 'package:flutter_getx_base/resources/widgets/base_widget.dart';

class HomeScreen extends BaseScaffold<HomeController> {
  @override
  String title() {
    return 'Select mode';
  }

  @override
  Widget buildChild(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: controller.goToLoadMoreScreen,
            child: Text('Load more mode'),
          ),
          ElevatedButton(
            onPressed: controller.goToRefreshTokenScreen,
            child: Text('Refresh token mode'),
          ),
          ElevatedButton(
            onPressed: controller.goToAnimationScreen,
            child: Text('Animation mode'),
          ),
          ElevatedButton(
            onPressed: controller.onLogout,
            child: Text('Logout'),
          )
        ],
      ),
    );
  }
}
