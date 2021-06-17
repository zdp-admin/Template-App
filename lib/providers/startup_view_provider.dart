import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _ViewModelProviderType {WithoutConsumer, WithConsumer }

class StartUpViewProvider<T extends ChangeNotifier> extends StatefulWidget {

  final Widget staticChild;
  final Function(T) onModelReady;
  final Widget Function(BuildContext, T, Widget) builder;
  final T viewModel;
  final _ViewModelProviderType providerType;

  StartUpViewProvider.withoutConsumer({
    @required this.builder,
    @required this.viewModel,
    this.onModelReady
  }) : providerType = _ViewModelProviderType.WithoutConsumer,
      staticChild = null;

  StartUpViewProvider.withConsumer({
    @required this.viewModel,
    @required this.builder,
    this.staticChild,
    this.onModelReady
  }) : providerType = _ViewModelProviderType.WithConsumer;

  @override
  _StartUpViewProviderState<T> createState() => _StartUpViewProviderState<T>();
}

class _StartUpViewProviderState<T extends ChangeNotifier> extends State<StartUpViewProvider<T>> {

  T _model;

  @override
  void initState() {
    super.initState();
    _model = widget.viewModel;

    if (widget.onModelReady != null) {
      widget.onModelReady(_model);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.providerType == _ViewModelProviderType.WithoutConsumer) {
      return ChangeNotifierProvider(
        create: (context) => _model,
        child: widget.builder(context, _model, null)
      );
    }

    return ChangeNotifierProvider(
      create: (context) => _model,
      child: Consumer(
        builder: widget.builder,
        child: widget.staticChild,
      ),
    );
  }
}