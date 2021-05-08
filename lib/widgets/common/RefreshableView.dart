import 'package:flutter/material.dart';

class ScootrRefreshableView<T> extends StatefulWidget {
  final Future<T> Function() future;

  final Widget Function(T result) builder;

  ScootrRefreshableView({
    required this.future,
    required this.builder,
  });

  @override
  _ScootrRefreshableViewState<T> createState() => _ScootrRefreshableViewState<T>();
}

class _ScootrRefreshableViewState<T> extends State<ScootrRefreshableView> {
  T? _result;

  Future<void> _handleRefresh() async {
    setState(() => _result = null);

    final T result = await widget.future();

    if (mounted)
    {
      setState(() => _result = result);
    }
  }

  @override
  void initState() {
    super.initState();

    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: RefreshIndicator(
              onRefresh: _handleRefresh,
              backgroundColor: Theme.of(context).appBarTheme.color,
              child: _result != null
                ? (widget as ScootrRefreshableView<T>).builder(_result!)
                : CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
