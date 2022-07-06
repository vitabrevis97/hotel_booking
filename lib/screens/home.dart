import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../elements/featured_item.dart';
import '../elements/recommended_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var featuresList = features.toList();

  void mnain() {
    var featuresList = features.toList();

    for (var i = 0; i < featuresList.length; i++) {
      // print(featuresList[i]['name']);

      if (featuresList[i]['location'] != "Phnom Penh") {
        print(featuresList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 251, 251),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: buildBody(),
          )
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.place_outlined,
                    color: Colors.grey,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Phnom Penh",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(),
          // NotificationBox(
          //   notifiedNumber: 1,
          //   onTap: () {},
          // )
        ],
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Text(
                "Find and Book",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Text(
                "The Best Hotel Rooms",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            getCities(), // phnom ,siem lista .. header
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Text(
                "Featured",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            getFeature(), //featured lista
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recommended",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            getRecommend(), //recommended lista
          ],
        ),
      ),
    );
  }

  getFeature() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: features[index],
          onTapFavorite: () {
            setState(() {
              features[index]["is_favorited"] =
                  !features[index]["is_favorited"];
            });
          },
          onTap: () {},
        ),
      ),
    );
  }

  getRecommend() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }

  getCities() {
    return SingleChildScrollView(
      // featured list.generate
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cities.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CityItem(
              data: cities[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
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
      child: Image.asset(image),
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
          color: isFavorited ? Colors.red : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: const Icon(
          Icons.favorite_outline,
          color: Color.fromARGB(255, 235, 170, 72),
        ),
      ),
    );
  }
}

class CityItem extends StatelessWidget {
  const CityItem(
      {Key? key, required this.data, this.isSelected = false, this.onTap})
      : super(key: key);
  final data;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: .5,
              blurRadius: .5,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data["name"],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: isSelected ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
