import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/presentation/Outfit_classification/Causal_wear_page.dart';
import 'package:sdgp_test01/presentation/Outfit_classification/Party_wear_page.dart';
import 'package:sdgp_test01/presentation/Outfit_classification/Work_wear_page.dart';

// Page 1

void showCarouselDialog(BuildContext context) {
  final List<Widget> carouselItems = [
    'Casual Wear',
    'Work Wear',
    'Party Wear',
  ].asMap().entries.map((entry) {
    int index = entry.key;
    String text = entry.value;
    return GestureDetector(
      onTap: () => navigateToPage(context, index + 1),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        // Add some space between items
        decoration: BoxDecoration(
          color: index == 0
              ? Colors.red
              : (index == 1 ? Colors.green : Colors.blue),
          borderRadius: BorderRadius.circular(20), // Border radius of 20
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }).toList();

  showDialog(
    context: context,
    builder: (_) => Dialog(
      child: CarouselSlider(
        items: carouselItems,
        options: CarouselOptions(
          height: 500.0,
          enableInfiniteScroll: true,
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
        ),
      ),
    ),
  );
}

void navigateToPage(BuildContext context, int index) {
  Widget page;
  switch (index) {
    case 1:
      page = const Casual_wear_page();
      break;
    case 2:
      page = const Work_wear_page();
      break;
    case 3:
      page = const Party_wear_page();
      break;
    default:
      return;
  }

  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 600),
    ),
  );
}
