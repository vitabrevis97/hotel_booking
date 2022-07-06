import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';
import '../elements/all_items.dart';
import '../elements/city_item.dart';
import 'package:booking_app/elements/featured_item.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 130,
            backgroundColor: const Color(0xFFF7F7F7),
            pinned: true,
            snap: true,
            floating: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'Explore',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                    ),
                  ),
                ),
                Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: .1,
                            blurRadius: 7,
                            offset: const Offset(
                                3, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                        ),
                        child: const SizedBox(
                          height: 33,
                          width: 33,
                          child: Icon(Icons.tune_outlined),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: buildBody(),
          ),
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
            getCities(),
            getRecommend(),

            //recommended lista
          ],
        ),
      ),
    );
  }

  getRecommend() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 0, 8, 10),
      scrollDirection: Axis.vertical,
      child: Column(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(top: 10),
            child: AllItem(
              data: recommends[index],
              onTap: () {},
            ),
          ),
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

  getCities() {
    return SingleChildScrollView(
      // featured list.generate
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CityItem(
              data: categories[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
