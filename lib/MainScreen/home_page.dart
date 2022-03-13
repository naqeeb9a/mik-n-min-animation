import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  List sliderImages = [
    // "assets/banner.jpg",
    "assets/mikmin.jpg",
    "assets/urbanKids2.jpg",
    "assets/pinkpetals.jpg"
  ];
  List imgList = [
    ["assets/pink-petals.gif", "assets/mik-n-min.gif"],
    ["assets/urbanKids.gif", "assets/saharAtif.gif"],
    ["assets/beehive.gif", "assets/cocobe.png"],
    ["assets/farah-gulkari.png", "assets/urbanKids.gif"],
  ];
  List gridList = [
    "assets/boys.jpg",
    "assets/new_arrivals.png",
    "assets/girls.jpg",
    "assets/accessories.jpg",
    "assets/Big.gif",
    "assets/footwear.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: mikNMinAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainSlider(),
            brandSlider(),
            const SizedBox(
              height: 20,
            ),
            mainPageGrid(),
          ],
        ),
      ),
    );
  }

  AppBar mikNMinAppBar() {
    return AppBar(
      leading: Image.asset(
        "assets/ham.png",
      ),
      backgroundColor: Colors.white,
      title: Image.asset(
        "assets/miknmin.png",
        width: 120,
      ),
      centerTitle: true,
      actions: [
        Image.asset(
          "assets/cart.png",
          width: 80,
        )
      ],
    );
  }

  mainSlider() {
    return CarouselSlider(
        items: sliderImages
            .map((e) => Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(e), fit: BoxFit.cover)),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
        ));
  }

  brandSlider() {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imgList
                .map((e) => SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(e[0]),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(e[1]),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }

  mainPageGrid() {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 13 / 18),
        itemCount: gridList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(gridList[index]), fit: BoxFit.fill)),
          );
        });
  }
}
