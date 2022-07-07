import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scaffold/core/boilerplate/bloc/bloc.dart';

typedef BlocWidgetBuilder<T> = Widget Function(BuildContext context, T state);

class BoilerplateBlocBuilder<B extends StateStreamable<S>, S, T extends S>
    extends StatelessWidget {
  const BoilerplateBlocBuilder({
    super.key,
    required this.builder,
    this.bloc,
    this.widgetWrapper,
  });

  final B? bloc;
  final BlocWidgetBuilder<T> builder;
  final Widget Function(Widget child)? widgetWrapper;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      bloc: bloc,
      builder: (context, state) {
        if (state is LoadingState) {
          return _wrapWidget(
            const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is ErrorState) {
          return _wrapWidget(
            const Center(
              child: Text("Error, Please try again"),
            ),
          );
        }

        // Type cast to desired state
        if (state is! T) throw Exception("State is not of type T");
        return builder(context, state);
      },
    );
  }

  Widget _wrapWidget(Widget child) {
    return widgetWrapper != null ? widgetWrapper!(child) : child;
  }
}
