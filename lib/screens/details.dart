import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool boxIsControlled) {
          return <Widget>[
            SliverAppBar(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              title: null,
              expandedHeight: MediaQuery.of(context).size.height * 0.35,
              floating: true,
              pinned: false,
              snap: true,
              flexibleSpace: Stack(
                children: const <Widget>[
                  Positioned.fill(
                      child: Image(
                    image: AssetImage('assets/kg.webp'),
                    fit: BoxFit.cover,
                  ))
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
            child: DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        )),
      ),
    );
  }
}
