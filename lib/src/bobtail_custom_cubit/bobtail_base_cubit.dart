import 'package:bloc/bloc.dart';
import 'bobtail_base_states.dart';

abstract class BobtailBaseCubit<T extends BobtailBaseState> extends Cubit<T> {
  BobtailBaseCubit(T state) : super(state);

  /// Super.emit throws exception on [isClosed].
  /// This override suppresses the exception with early return.
  @override
  void emit(T state) {
    if (isClosed) return;
    super.emit(state);
  }
}
