import 'package:carousel_slider/carousel_slider.dart';

import '../const/all_imports.dart';

class CustomCarousel extends StatelessWidget {
  final bool autoplay;
  final double? height;
  final int durationInSeconds;
  final List<Widget> items;
  const CustomCarousel({
    super.key,
    required this.autoplay,
    required this.durationInSeconds,
    this.height,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
            autoPlay: autoplay,
            height: height,
            autoPlayAnimationDuration: Duration(seconds: durationInSeconds)));
  }
}
