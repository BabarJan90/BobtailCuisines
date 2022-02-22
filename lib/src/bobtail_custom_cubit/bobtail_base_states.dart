class BobtailBaseState {
  final bool initializing;
  final bool busy;
  final bool idle;
  final bool error;
  final bool empty;

  BobtailBaseState({
    bool initializing = false,
    bool busy = false,
    bool idle = false,
    bool error = false,
    bool empty = false,
  })  : initializing = initializing,
        busy = busy,
        idle = idle,
        error = error,
        empty = empty;
  BobtailBaseState.initializing() : this(initializing: true);
  BobtailBaseState.busy() : this(busy: true);
  BobtailBaseState.idle() : this(idle: true);
  BobtailBaseState.error() : this(error: true);
  BobtailBaseState.empty() : this(empty: true);
}
