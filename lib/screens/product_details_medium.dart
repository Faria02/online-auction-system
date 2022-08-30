import 'package:auction/screens/product_topbar.dart';
import 'package:flutter/material.dart';

class productDetailsMedium extends StatelessWidget {
  const productDetailsMedium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
      drawer: const productTopBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/chair.jpg',
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
                            children: const [
                              Text(
                                'Product Title: Chair',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sapien ipsum, dignissim elementum ultricies in, rutrum sit amet elit.\n\neu interdum nisl. Maecenas vitae malesuada nisl. Nullam ornare dui rutrum augue luctus, vel ultricies felis mollis. Nulla ac erat felis. Nulla quis consequat leo. Donec ac porta nisl, ut aliquam urna. Integer quis dui non sem congue dapibus a non lorem. Suspendisse tortor ipsum, auctor ut magna ac, varius egestas nibh. Aliquam id eros auctor, suscipit libero at, pellentesque lorem. Proin et leo mauris.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Price: 2000',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Minimum bid: 2500',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Catagory : Chair',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Brand : Chair',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Rating : 8.5',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                color: const Color(0xff373e98),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
        ),
      ),
    );
  }
}
