import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFFF7F7F7),
              pinned: true,
              snap: true,
              floating: true,
              title: getAppBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ));
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Settings",
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.add_a_photo_outlined,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Add a photo',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Sangvaleap",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "+12 345 6789",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          SettingItem(
              title: "General Setting",
              leadingIcon: Icons.settings,
              leadingIconColor: Colors.orange,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Bookings",
              leadingIcon: Icons.bookmark_border,
              leadingIconColor: Colors.blue,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Favorites",
              leadingIcon: Icons.favorite,
              leadingIconColor: Colors.red,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
              title: "Privacy",
              leadingIcon: Icons.privacy_tip_outlined,
              leadingIconColor: Colors.green,
              onTap: () {}),
          const SizedBox(height: 10),
          SettingItem(
            title: "Log Out",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.grey.shade400,
            onTap: () {
              // showConfirmLogout();
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // showConfirmLogout() {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => CupertinoActionSheet(
  //       message: const Text("Would you like to log out?"),
  //       actions: [
  //         CupertinoActionSheetAction(
  //           onPressed: () {},
  //           child: Text(
  //             "Log Out",
  //             style: TextStyle(color: actionColor),
  //           ),
  //         )
  //       ],
  //       cancelButton: CupertinoActionSheetAction(
  //         child: const Text("Cancel"),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ),
  //   );
  // }
}

class CustomImage extends StatelessWidget {
  const CustomImage(this.image,
      {this.width = 100,
      this.height = 100,
      this.bgColor,
      this.borderWidth = 0,
      this.borderColor,
      this.trBackground = false,
      this.fit = BoxFit.cover,
      this.isNetwork = true,
      this.radius = 50,
      this.borderRadius,
      this.isShadow = true});
  final String image;
  final double width;
  final double height;
  final double borderWidth;
  final bool isShadow;
  final Color? borderColor;
  final Color? bgColor;
  final bool trBackground;
  final bool isNetwork;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        boxShadow: [
          if (isShadow)
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
        ],
      ),
      child: Image(
        image: AssetImage(image),
        fit: fit,
      ),
    );
  }
}

class BlankImageWidget extends StatefulWidget {
  const BlankImageWidget({Key? key}) : super(key: key);

  @override
  _BlankImageWidgetState createState() => _BlankImageWidgetState();
}

class _BlankImageWidgetState extends State<BlankImageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(0),
      child: Center(
          child: SizedBox(
        child: Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          elevation: 0.0,
        ),
      )),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final String title;
  final GestureTapCallback? onTap;
  const SettingItem(
      {Key? key,
      required this.title,
      this.onTap,
      this.leadingIcon,
      this.leadingIconColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: leadingIcon != null
                ? [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        leadingIcon,
                        size: 24,
                        color: leadingIconColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 14,
                    )
                  ]
                : [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 14,
                    )
                  ],
          ),
        ),
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  const IconBox(
      {Key? key,
      required this.child,
      this.bgColor = Colors.white,
      this.onTap,
      this.borderColor = Colors.transparent,
      this.radius = 50,
      this.padding = 5,
      this.isShadow = true})
      : super(key: key);
  final Widget child;
  final Color borderColor;
  final Color bgColor;
  final double radius;
  final double padding;
  final GestureTapCallback? onTap;
  final bool isShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
          boxShadow: [
            if (isShadow)
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
          ],
        ),
        child: child,
      ),
    );
  }
}
