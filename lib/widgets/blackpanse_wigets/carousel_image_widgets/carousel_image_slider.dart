import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:planta/widgets/blackpanse_wigets/carousel_image_widgets/carousel_image_indicator.dart';
import 'package:planta/widgets/blackpanse_wigets/carousel_image_widgets/image_slider_controller.dart';

class CarouselImageSlider extends StatefulWidget {
  const CarouselImageSlider({super.key});

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  CarouselSliderController _controller = CarouselSliderController();
  final featuredImages = [
    'assets/images/black_panse.png',
    'assets/images/black_panse.png',
    'assets/images/black_panse.png'
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      CarouselSlider.builder(
        itemCount: featuredImages.length,

        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color(0xFFF6F6F6),
                image: DecorationImage(
                    image: AssetImage(featuredImages[index]),
                    fit: BoxFit.cover)),
          );
        },
        carouselController: _controller, // Give the controller
        options: CarouselOptions(
            autoPlay: false,
            aspectRatio: 1.5,
            viewportFraction: 1.0,
            initialPage: 1,
            scrollPhysics: const NeverScrollableScrollPhysics(),
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImageSliderController(
            icon: Icons.arrow_back_ios,
            onPressed: () => _controller.previousPage(),
          ),
          ImageSliderController(
            icon: Icons.arrow_forward_ios,
            onPressed: () => _controller.nextPage(),
          )
        ],
      ),
      CarouselImageIndicator(
        currentIndex: _current,
        featuredImages: featuredImages,
      )
    ]);
  }
}
