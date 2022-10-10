import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  List<String> images = [
    "https://cdn.cms.tagadamedia.com/pruebayamx/2021-01/petco-20-150121-00-1.jpg",
    "https://i.ytimg.com/vi/h8q3cLtrtjc/maxresdefault.jpg",
    "https://ofertadescuentos.com/wp-content/uploads/2020/07/Temporada-Naranja-2020-La-comer-3x2-en-alimento-y-accesorios-para-mascotas-1024x577.jpg",
    "https://www.heb.com.mx/media/wysiwyg/mes-de-la-mascota-envio-gratis-landing-mascotas.png"
  ];

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      return SizedBox(
        width: 250,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      child: Image.network(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    print(currentIndex);
    return Container(
      margin: EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(images[pagePosition]))),
  );
}
