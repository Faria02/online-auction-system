import 'package:auction/screens/auth/mainlogin.dart';
import 'package:auction/screens/buyer_product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class buyerDashboard extends StatefulWidget {
  const buyerDashboard({Key? key}) : super(key: key);

  @override
  State<buyerDashboard> createState() => _buyerDashboardState();
}

class _buyerDashboardState extends State<buyerDashboard> {
  List<String> catagoryList = [
    'top',
    'sold',
    'shoe',
    'bag',
    'tv',
    'fridge',
  ];
  List<String> collectionName = [
    'top',
    'sold',
    'shoe',
    'bag',
    'tv',
    'fridge',
  ];
  int selectedIndex = 0;
  List items = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    getData('top');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xff373e98),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          const Text(
                            'Buyer Dashboard',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     PageRouteBuilder(
                              //         pageBuilder: (context, a, b) =>
                              //             const mainLoginLarge()),
                              //     (route) => false);
                            },
                            child: const Text(
                              'Home',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          const Text(
                            'About',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          const Text(
                            'Contact',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          const mainLogin()),
                                  (route) => false);
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        height: MediaQuery.of(context).size.height,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        child: Column(
                          children: [
                            const Text(
                              'All Catagory',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 500,
                              child: ListView.separated(
                                  itemCount: catagoryList.length,
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemBuilder: ((context, index) {
                                    return MaterialButton(
                                        color: index == selectedIndex
                                            ? Color(0xff373e98)
                                            : null,
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          selectedIndex = index;
                                          items.clear();
                                          getData(collectionName[index]);
                                          setState(() {});
                                        },
                                        child: Text(
                                          catagoryList[index],
                                          style: TextStyle(
                                            color: index == selectedIndex
                                                ? Colors.white
                                                : null,
                                          ),
                                        ));
                                  })),
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 50, right: 50, top: 30, bottom: 30),
                            height: MediaQuery.of(context).size.height,
                            width: double.infinity,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  BuyerProductDetails(
                                                      item: items[index])),
                                          (route) => false);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                              color: Colors.white,
                                              width: 200,
                                              height: double.infinity,
                                              child: Image.network(
                                                items[index]['image'],
                                                fit: BoxFit.fitHeight,
                                              )),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                items[index]['title'],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Price: ${items[index]['price']}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 1),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Catagory: ${items[index]['catagory']}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 1),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Rating: ${items[index]['rating']}',
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Minimum Bid: ${items[index]['minimum bid']}',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    letterSpacing: 1),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 20,
                                  );
                                },
                                itemCount: items.length),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: const Color(0xff373e98),
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 55,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/logo.jpg'),
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 18,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
                              fontSize: 14,
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
        ),
      ),
    );
  }

  Future getData(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var data = await firestore.collection(collectionName).get();
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
}
