import 'package:auction/screens/auth/mainlogin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BuyerProductDetails extends StatefulWidget {
  const BuyerProductDetails({Key? key, required this.item}) : super(key: key);
  final Map item;

  @override
  State<BuyerProductDetails> createState() => _BuyerProductDetailsState();
}

class _BuyerProductDetailsState extends State<BuyerProductDetails> {
  var bid = "";
  final bidController = TextEditingController();
  @override
  void dispose() {
    // clean up the controller when the widget is disposed.
    bidController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                          'Online Auction System',
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
                            'Login',
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              width: screenSize.width,
              height: screenSize.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height,
                        width: screenSize.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                widget.item['image'],
                              ),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item['title'],
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.item['description'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Price: ${widget.item['price']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Minimum bid: ${widget.item['minimum bid']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Catagory : ${widget.item['catagory']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Brand : ${widget.item['brand']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Rating : ${widget.item['rating']}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                                child: Column(
                              children: [
                                FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.black),
                                    autofocus: false,
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                      label: Text(
                                        'Enter Bid Amount',
                                      ),
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.black),
                                    ),
                                    controller: bidController,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 20)),
                                      onPressed: () async {
                                        final docUser =
                                            FirebaseFirestore.instance
                                                .collection(
                                                  'shoe',
                                                )
                                                .doc('s3XLmigyZMrxQMyTr59B');
                                        //update
                                        docUser.update({
                                          'minimum bid': bidController.text,
                                        });
                                        final docUsers =
                                            FirebaseFirestore.instance
                                                .collection(
                                                  'top',
                                                )
                                                .doc('GG7r248tXEvg4XAJo9vk');
                                        //update
                                        docUsers.update({
                                          'minimum bid': bidController.text,
                                        });
                                        final docUserbag =
                                            FirebaseFirestore.instance
                                                .collection(
                                                  'top',
                                                )
                                                .doc('lJQxQnk6h7Vac30G91uN');
                                        //update
                                        docUserbag.update({
                                          'minimum bid': bidController.text,
                                        });
                                      },
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2),
                                      )),
                                ),
                              ],
                            ))
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xff373e98),
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
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
        ))),
      ),
    );
  }
}
