import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      options: CarouselOptions(
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      itemBuilder: (ctx, index, realIdx) {
        return Stack(
          children: [
            Container(
              height: 200,
              width: w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://us.123rf.com/450wm/utima/utima1512/utima151200004/50416917-red-apple-fruit-with-drops-and-leaves-with-clipping-path.jpg?ver=6'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 200,
              width: w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Shopping Card',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Shopping!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

