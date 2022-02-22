import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bobtail_base_cubit.dart';
import 'bobtail_base_states.dart';

typedef BobtailBlocWidgetBuilder<S extends BobtailBaseState, T extends BobtailBaseCubit> = Widget
    Function(BuildContext context, S state, T bloc);
typedef BobtailBlocWidgetListener<S extends BobtailBaseState, T extends BobtailBaseCubit> = void
    Function(BuildContext context, S state, T bloc);

class CubitProvider<S extends BobtailBaseState, T extends BobtailBaseCubit<S>>
    extends StatelessWidget {
  final Create<T> create;
  final bool lazy;

  final BobtailBlocWidgetBuilder<S, T> builder;
  final BobtailBlocWidgetListener<S, T>? listener;

  final BlocBuilderCondition<S>? buildWhen;

  final BlocListenerCondition<S>? listenWhen;
  const CubitProvider({
    Key? key,
    required this.create,
    required this.builder,
    this.listener,
    this.buildWhen,
    this.listenWhen,
    this.lazy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      lazy: lazy,
      create: create,
      child: BlocConsumer<T, S>(
        builder: (context, state) {
          final bloc = context.read<T>();
          return builder(context, state, bloc);
        },
        listener: (context, state) {
          if (listener == null) {
          } else {
            final bloc = context.read<T>();
            listener!(context, state, bloc);
          }
        },
        buildWhen: buildWhen,
        listenWhen: listenWhen,
      ),
    );
  }
}
