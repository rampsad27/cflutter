import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Honey",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 32, 17, 0),
            fontFamily: "DummyName",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: false,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            // print("This is something");
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Organic honey",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 248, 112, 1),
                  fontFamily: "DummyName",
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 248, 146, 2),
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Image.network(
                  "https://images.unsplash.com/photo-1587049352851-8d4e89133924?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aG9uZXl8ZW58MHx8MHx8fDA%3D",
                  height: 450,
                  // fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Made in Citwan",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 118, 103, 93),
                  // fontFamily: "DummyName",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 149, 0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    height: 60,
                    width: 130,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 15, 45, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                  // height: 400,
                  ),
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/img1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Image.network(
                      "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/04/honey-1296x728-header.jpg?w=1155&h=1528",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    );
  }
}
