import 'package:flutter/material.dart';
import 'package:flutter_application/qr_code.dart';
import 'package:flutter_application/search.dart';
import 'package:flutter_application/promo.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  PageController _promoPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        iconSize: 25.0,
      ),
      body: Stack(
        children: [
          Image.asset(
            "images/homebg.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(),
                  buildXpBar(),
                  buildXpBar2(),
                  const SizedBox(height: 15),
                  promooffer(),
                  buildpromo(),
                  const SizedBox(height: 15),
                  VoucherCard(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRCodePage()),
          );
        },
        child:
            Icon(Icons.qr_code, color: Colors.brown), // Set icon color to white
        backgroundColor: Color.fromARGB(255, 255, 225, 159),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              30.0), // Set border radius to create a circle
        ),
      ),
    );
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentPage = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchPage()),
        );
      }
    });
  }

  Widget buildHeader() {
    return Stack(
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 225, 159),
                Color.fromARGB(255, 255, 250, 222),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("images/pfp1.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Steven Wu Laurent!',
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.brown,
                                size: 20,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Plaza Mall - Jakarta',
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        // Handle your notification button onPressed action
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.brown,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            buildYourPoints(),
          ],
        ),
      ],
    );
  }

  Widget buildYourPoints() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 22),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/poinbg.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Active Poin",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "0",
                        style: TextStyle(
                          color: Colors.brown,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10, // Adjust the spacing as needed
                ),
                GestureDetector(
                  onTap: () {
                    print("Get Points button tapped!");
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildXpBar() {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // Adjusted top padding
          child: Container(
            height: 6, // Sesuaikan tinggi garis XP
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 214, 214, 214),
              borderRadius: BorderRadius.circular(2), // Setengah dari tinggi
            ),
          ),
        ),
      ),
    );
  }

  Widget buildXpBar2() {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(6, (index) {
              int pointValue = (index + 1) * 5;
              return Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 230, 230, 230),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '$pointValue',
                      style: TextStyle(
                          color: Color.fromARGB(255, 214, 214, 214),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget promooffer() {
    List<String> promoImages = [
      'images/PromoOffer2.png',
      'images/PromoOffer3.png',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: const Text(
            "Promo Poin dan Rewards",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              top: 20), // Sesuaikan jarak antara xp bar dan promooffer
          height: 160,
          child: PageView.builder(
            controller: _promoPageController,
            itemCount: promoImages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              double scaleFactor = 1.0;
              double opacity = 1.0;

              return Opacity(
                opacity: opacity,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(promoImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  transform: Matrix4.identity()..scale(scaleFactor),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildpromo() {
    List<PromoData> promos = [
      PromoData(
        image: "images/promo1.jpg",
        discount: "50% OFF",
        description: "Earn 20 loyalty points",
      ),
      PromoData(
        image: "images/promo2.jpg",
        discount: "30% OFF",
        description: "Earn 30 loyalty points",
      ),
      PromoData(
        image: "images/promo3.jpg",
        discount: "Buy 1 Get 1 Free",
        description: "Limited time offer",
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(19),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Penawaran untukmu",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PromoPage()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.brown,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: promos.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PromoItem(
                    image: promos[index].image,
                    discount: promos[index].discount,
                    description: promos[index].description,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          buildPagedot(),
        ],
      ),
    );
  }

  Widget buildPagedot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.brown : Colors.grey,
          ),
        );
      }),
    );
  }
}

class PromoData {
  final String image;
  final String discount;
  final String description;

  PromoData({
    required this.image,
    required this.discount,
    required this.description,
  });
}

class PromoItem extends StatelessWidget {
  final String image;
  final String discount;
  final String description;

  const PromoItem({
    Key? key,
    required this.image,
    required this.discount,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, // Set the width based on your design
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                discount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VoucherCard extends StatelessWidget {
  const VoucherCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          // Use the AssetImage directly in BoxDecoration as a background image
          image: DecorationImage(
            image: AssetImage('images/PromoOffer1.png'),
            fit: BoxFit
                .fill, // Menggunakan BoxFit.fill agar gambar mencakup keseluruhan container
          ),
        ),
      ),
    );
  }
}
