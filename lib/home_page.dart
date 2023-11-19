import 'package:flutter/material.dart';
import 'package:flutter_application/qr_code.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryNames = ["Semua", "Makanan", "Pakaian", "Kosmetik"];
  int _currentPage = 0;
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        iconSize: 25.0,
      ),
      body: Container(
        height: double.infinity,
        child: Stack(
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
                    buildCategories(),
                    promooffer(),
                    buildpromo(),
                    const VoucherCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
                Color(0xFFFBF4EA),
                Color(0xFFF9F9F9),
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
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // QR Code button with circular background
                  Container(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(240, 239, 234, 1.0),
                          shape: BoxShape.circle,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodePage()),
                          );
                        },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.qr_code_rounded,
                              color: Colors.brown,
                              size: 30,
                            ),
                          ),
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
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
    child: Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
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
                      "Your Points",
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    // Your Points Value (replace with actual points)
                    Text(
                      "0", // Replace with the actual points value
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    buildXPBar(),
                  ],
                ),
              ),
              SizedBox(
                width: 10, // Adjust the spacing as needed
              ),
              GestureDetector(
                onTap: () {
                  // Handle the button click event
                  // Add your logic here to get points
                  print("Get Points button tapped!");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(132, 110, 69, 1.0),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Get Points",
                    style: TextStyle(
                      color: Color.fromRGBO(132, 110, 69, 1.0),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
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

  Widget buildXPBar() {
    return Container(
      width: 400,
      height: 8,
      color: Colors.yellow,
    );
  }

  Widget buildCategories() {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: 0.9, // Sesuaikan dengan faktor lebar yang diinginkan
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryNames.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == _selectedCategoryIndex;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 80, // Sesuaikan dengan lebar yang diinginkan
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelected
                                ? const Color.fromRGBO(132, 110, 69, 1.0)
                                : const Color.fromRGBO(240, 239, 234, 1.0),
                          ),
                          child: Center(
                            child: Text(
                              categoryNames[index],
                              style: TextStyle(
                                color: isSelected
                                    ? const Color.fromRGBO(240, 239, 234, 1.0)
                                    : const Color.fromRGBO(132, 110, 69, 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget promooffer() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.only(
            top: 20), // Sesuaikan nilai top sesuai kebutuhan
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/PromoOffer1.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
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
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Penawaran untukmu",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        height: 150,
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          // Use the AssetImage directly in BoxDecoration as a background image
          image: DecorationImage(
            image: AssetImage('images/voucher1.png'),
            fit: BoxFit
                .fill, // Menggunakan BoxFit.fill agar gambar mencakup keseluruhan container
          ),
        ),
      ),
    );
  }
}
