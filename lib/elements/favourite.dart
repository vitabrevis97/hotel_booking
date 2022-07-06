import 'package:flutter/material.dart';

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

class FavoriteBox extends StatelessWidget {
  const FavoriteBox(
      {Key? key,
      this.bgColor = Colors.white,
      this.onTap,
      this.isFavorited = false,
      this.borderColor = Colors.transparent,
      this.radius = 50,
      this.size = 18,
      this.padding = 8})
      : super(key: key);
  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final double padding;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isFavorited
              ? const Color.fromARGB(255, 235, 170, 72)
              : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: const Icon(Icons.favorite_outline,
            color: Color.fromARGB(255, 235, 170, 72)),
      ),
    );
  }
}
