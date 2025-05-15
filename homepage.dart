// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:baskiti/CustomAppBar.dart';
import 'package:baskiti/CustomFooter.dart';
import 'package:baskiti/produit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> carouselImages = [
    'assets/sliders/slider1.png',
    'assets/sliders/slider2.jpg',
    'assets/sliders/slider3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Recherche...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            ProductSection(title: 'Nouveautés', products: [
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 22 Xlarge 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 22 Xlarge 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
            ]),
            ProductSection(title: 'Top Vendu', products: [
              {'name': 'DARI Couscous', 'price': '15.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'DURACELL Piles', 'price': '20.00 dh', 'image': 'assets/images/prod2.png'},
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 22 Xlarge 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
              {'name': 'MOLFIX Couches 36 Maxi 4U', 'price': '44.00 dh', 'image': 'assets/images/prod1.png'},
            ]),
            SizedBox(height: 20),
            Text(
                'Découvrez nos offres',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00253d),
                ),
              ),
            SizedBox(height: 15),
             CarouselSlider(
                items: carouselImages.map((imagePath) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }
}


class ProductSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> products;

  ProductSection({required this.title, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00253d),
                ),
              ),
              Text(
                'Voir plus',
                style: TextStyle(color: Color(0xFFE85E24)),
              ),
            ],
          ),
        ),
        Container(
          height: 200, // Ajustement de la hauteur pour le bouton
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailApp(productId: 24), // Passe l'ID du produit
                    ),
                  );
                },
                child:
              Stack(
                children: [
                  Container(
                    width: 140,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            product['image']!,
                            height: 80,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            product['name']!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            product['price']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    right: 15,
                    child: GestureDetector(
                      onTap: () {
                        // Action lors du clic sur le bouton +
                      },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Color(0xFFE85E24),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
            },
          ),
        ),
      ],
    );
  }
}
