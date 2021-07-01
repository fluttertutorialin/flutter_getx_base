import 'package:flutter/material.dart';
import 'package:flutter_getx_base/domain/modal/bengkei_user_model.dart';
import 'package:flutter_getx_base/presentation/refreshtoken/refresh_token_controller.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/widgets/base_widget.dart';
import 'package:flutter_getx_base/resources/widgets/infinite_scroll.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RefreshTokenScreen extends BaseScaffold<RefreshTokenController> {
  @override
  String title() {
    return 'Refresh token mode';
  }

  @override
  Widget buildChild(BuildContext context) {
    return controller.bengKeiUserListState.obx(
      ((data) => data != null
          ? InfiniteScrollList(
              state: controller.bengKeiUserListState,
              builder: (controller) {
                return ListView.separated(
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildItem(context, data[index]);
                  },
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                );
              },
            )
          : Container()),
      onError: (_) => Container(),
    );
  }

  Widget _buildItem(BuildContext context, BengKeiUserModel model) {
    return ListTile(
      leading: ClipOval(
        child: IconButton(
          icon: Icon(Icons.directions_bus),
          onPressed: () {},
          iconSize: fixed(PixelRatio.dp50),
        ),
      ),
      title: Text(model.userName ?? ''),
      subtitle: Text(model.age.toString()),
    );
  }
}
