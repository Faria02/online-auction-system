import 'package:auction/screens/home_topbarcontent.dart';
import 'package:auction/screens/product_details.dart';
import 'package:auction/screens/product_details_large.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePageMedium extends StatefulWidget {
  const HomePageMedium({Key? key}) : super(key: key);

  @override
  State<HomePageMedium> createState() => _HomePageMediumState();
}

class _HomePageMediumState extends State<HomePageMedium> {
  List<String> catagoryList = [
    'top',
    'sold',
  ];
  // List<String> collection = [
  //   'top',
  // ];
  List items = [];
  List solditems = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getSoldData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.blue,
            title: const Text(
              'Online Auction System',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          drawer: const TopBarContents(),
          body: Container(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/auction_cover_image.jpg',
                                ),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black54, BlendMode.darken)),
                          ),
                        ),
                        Positioned(
                          child: Column(
                            children: const [
                              Text(
                                'Online Action System',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 2),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ultrices malesuada et eros.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 2),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Top items',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 15,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      height: 250,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 50,
                            );
                          },
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (context, a, b) =>
                                            productDetailsLarge(
                                                item: items[index])),
                                    (route) => false);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                color: Colors.grey,
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 250,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  items[index]['image'],
                                                ),
                                                fit: BoxFit.cover,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        Colors.black54,
                                                        BlendMode.darken)),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 13,
                                            child: Column(
                                              children: [
                                                Text(
                                                  items[index]['title'],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Brand: ${items[index]['brand']}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Catagory: ${items[index]['catagory']}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Minimum bid : ${items[index]['minimum bid']}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Sold items',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width / 15,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      height: 250,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 50,
                            );
                          },
                          itemCount: solditems.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              // onTap: () {
                              //   Navigator.pushAndRemoveUntil(
                              //       context,
                              //       PageRouteBuilder(
                              //           pageBuilder: (context, a, b) =>
                              //               const productDetails()),
                              //       (route) => false);
                              // },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                color: Colors.grey,
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 250,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  solditems[index]['image'],
                                                ),
                                                fit: BoxFit.cover,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        Colors.black54,
                                                        BlendMode.darken)),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 13,
                                            child: Column(
                                              children: [
                                                Text(
                                                  solditems[index]['title'],
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Brand: ${solditems[index]['brand']}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Catagory: ${solditems[index]['catagory']}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Minimum bid : ${solditems[index]['minimum bid']}',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      letterSpacing: 1),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: const Color(0xff373e98),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: CircleAvatar(
                                  radius: 40,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/logo.jpg'),
                                          fit: BoxFit.fill),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'HOME',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'ABOUT',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'CONTACT',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'PRIVACY POLICY',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Contact with us',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width / 15,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Phone: 01793826563',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'E-mail: cse1805003brur@gmail.com',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'WhatsApp: +8801793826563',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    letterSpacing: 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Future getData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection('top').get();
    for (var item in data.docs) {
      setState(() {
        items.add({
          'brand': item['brand'],
          'catagory': item['catagory'],
          'description': item['description'],
          'image': item['image'],
          'price': item['price'],
          'minimum bid': item['minimum bid'],
          'rating': item['rating'],
          'title': item['title']
        });
      });
    }
  }

  Future getSoldData() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection('sold').get();
    for (var solditem in data.docs) {
      setState(() {
        solditems.add({
          'brand': solditem['brand'],
          'catagory': solditem['catagory'],
          'description': solditem['description'],
          'image': solditem['image'],
          'price': solditem['price'],
          'minimum bid': solditem['minimum bid'],
          'rating': solditem['rating'],
          'title': solditem['title']
        });
      });
    }
  }
}
