import 'dart:async';

abstract class HomePageRouteController {
  static final _controller = StreamController<int>.broadcast();

  static Stream<int> get stream => _controller.stream;

  static void changePage(int index) => _controller.add(index);
}
