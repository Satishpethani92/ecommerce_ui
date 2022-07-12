import 'package:ecommerce_ui/core/routing/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_model.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T) onModelReady;

  const BaseView({Key? key, required this.builder, required this.onModelReady}) : super(key: key);

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      //builder: (context) => model,
      value: model,
      //builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
