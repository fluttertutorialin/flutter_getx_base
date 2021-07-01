import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/domain/modal/user_model.dart';
import 'package:flutter_getx_base/presentation/loadmoreuser/loadmore_user_controller.dart';
import 'package:flutter_getx_base/resources/size/pixel_ratio.dart';
import 'package:flutter_getx_base/resources/widgets/base_widget.dart';
import 'package:flutter_getx_base/resources/widgets/infinite_scroll.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoadmoreScreen extends BaseScaffold<LoadmoreController> {
  @override
  String title() {
    return 'Load more mode';
  }

  @override
  Widget buildChild(BuildContext context) {
    return controller.userListState.obx(
      (data) => data != null
          ? InfiniteScrollList(
              state: controller.userListState,
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
              onLoadMore: controller.getUserList,
              onRefresh: () async {
                controller.getUserList();
              },
            )
          : Container(),
      onError: (_) => Container(),
    );
  }

  Widget _buildItem(BuildContext context, UserModel model) {
    return Container(
      width: 200,
      child: ListTile(
        onTap: () {
          controller.goToLoadmore();
        },
        leading: ClipOval(
          child: Image.network(
            model.pictureModel?.medium ?? '',
            width: fixed(PixelRatio.dp50),
            height: fixed(PixelRatio.dp50),
          ),
        ),
        title: Text(model.name?.first ?? ''),
        subtitle: Text(model.email ?? ''),
      ),
    );
  }
}
