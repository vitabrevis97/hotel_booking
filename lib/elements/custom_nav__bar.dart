import 'package:flutter/material.dart';

import '../screens/bloc/home_route_page_controller.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  static final _icons = <IconData>[
    Icons.home_outlined,
    Icons.search_outlined,
    Icons.add_location_alt_outlined,
    Icons.settings_outlined
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(color: const Color.fromARGB(41, 168, 168, 168))),
      child: StreamBuilder<int>(
        stream: HomePageRouteController.stream,
        initialData: 0,
        builder: (context, page) {
          return Row(
            children: [
              for (int i = 0; i < _icons.length; i++)
                Expanded(
                  child: InkWell(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: kBottomNavigationBarHeight + 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(
                              //     color: i == page.data!
                              //         ? const Color.fromARGB(27, 195, 193, 193)
                              //         : Colors.transparent,
                              //     width: 2),
                              borderRadius: BorderRadius.circular(50),

                              boxShadow: [
                                BoxShadow(
                                    color: i == page.data!
                                        ? Colors.grey.withOpacity(0.1)
                                        : Colors.transparent,
                                    spreadRadius: 4,
                                    blurRadius: 5,
                                    offset: const Offset(
                                      0,
                                      0,
                                    ) // changes position of shadow
                                    ),
                              ],
                            ),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                _icons[i],
                                color: i == page.data!
                                    ? const Color.fromARGB(255, 235, 170, 72)
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => HomePageRouteController.changePage(i),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
