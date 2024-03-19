import 'package:flutter/material.dart';

class ReusableRefreshIndicator extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const ReusableRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  State<ReusableRefreshIndicator> createState() =>
      _ReusableRefreshIndicatorState();
}

class _ReusableRefreshIndicatorState extends State<ReusableRefreshIndicator> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _handleRefresh() async {
    setState(() {});

    await widget.onRefresh();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _handleRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: widget.child,
      ),
    );
  }
}
