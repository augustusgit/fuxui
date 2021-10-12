import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wurkfux/constants/colors.dart';

class CarouselWithIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://outsourcingangel'
          '.com/wp-content/uploads/2020/09/How-You-Can-Outsource-Your-Calendar'
          '-Schedule-to-a-Virtual-Assistant.png',
      'https://outsourcingangel.com/wp-content/uploads/2020/09/How-You-Can-Outsource-Your-Calendar-Schedule-to-a-Virtual-Assistant.png',
      'https://outsourcingangel.com/wp-content/uploads/2020/09/How-You-Can-Outsource-Your-Calendar-Schedule-to-a-Virtual-Assistant.png'
    ];
    final List<Widget> child = List.generate(images.length, (index) {
      return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: InkWell(
              onTap: () {
                print("you click  $index ");
              },
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              )),
        ),
      );
    });

    return Column(children: [
      CarouselSlider(
        items: child,
        options: CarouselOptions(
            initialPage: _current,
            autoPlayCurve: Curves.easeInOut,
            height: 200.0,
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: MediaQuery.of(context).size.aspectRatio,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          child.length,
          (index) => Container(
            width: _current == index ? 32 * 3 : 16,
            height: 8.0,
            margin:
                EdgeInsets.only(top: 16.0, left: 4.0, right: 4.0, bottom: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15.0),
              color: _current == index
                  ? AppColors.newGreen
                  : AppColors.neutralGrey,
            ),
          ),
        ),
      ),
    ]);
  }
}
