import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_base/domain/base/process_state.dart';

typedef WidgetCallback = ScrollView Function(ScrollController);

typedef FutureCallback = Future<void> Function();

double visibleThreshold = 200;

class InfiniteScrollList extends StatefulWidget {
  const InfiniteScrollList({
    this.onLoadMore,
    this.onRefresh,
    required this.state,
    required this.builder,
  });
  final FutureCallback? onRefresh;
  final VoidCallback? onLoadMore;
  final WidgetCallback builder;
  final ProcessState state;

  @override
  _InfiniteScrollListState createState() => _InfiniteScrollListState();
}

class _InfiniteScrollListState extends State<InfiniteScrollList> {
  final ScrollController _scrollController = ScrollController();
  double currentMaxExtent = 0;

  @override
  void initState() {
    super.initState();
    if (widget.onLoadMore != null) {
      _scrollController.addListener(() async {
        if (_scrollController.position.extentAfter < visibleThreshold &&
            !widget.state.status.isLoadingMore &&
            currentMaxExtent != _scrollController.position.maxScrollExtent) {
          currentMaxExtent = _scrollController.position.maxScrollExtent;
          widget.onLoadMore!.call();
        }
      });
    }

    widget.state.addListener(() {
      if (widget.state.status.isError) {
        currentMaxExtent = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.onRefresh == null
        ? widget.builder(_scrollController)
        : RefreshIndicator(
            child: widget.builder(_scrollController),
            onRefresh: () async {
              widget.state.onRefreshing();
              await widget.onRefresh!();
            },
          );
  }
}
