import 'package:booking_app/elements/custom_nav__bar.dart';
import 'package:booking_app/screens/home.dart';
import 'package:booking_app/screens/hotels.dart';
import 'package:booking_app/screens/novi_screen.dart';
import 'package:booking_app/screens/settings.dart';
import 'package:flutter/material.dart';

import 'bloc/home_route_page_controller.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> with TickerProviderStateMixin {
  int activeTabIndex = 0;

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

//====== end set animation=====

  final screens = [
    const HomePage(),
    const HomePage2(),
    const Hotels(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<int>(
              stream: HomePageRouteController.stream,
              initialData: 0,
              builder: (context, page) {
                return Container(
                  child: screens.elementAt(page.data!),
                );
              },
            ),
          ),
          const CustomNavBar(),
        ],
      ),
    );
  }
}
