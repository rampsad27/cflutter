import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(248, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 240, 239, 239),
        title: const Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi User,",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 32, 17, 0),
              ),
            ),
            Text(
              "Good Morning!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 224, 147, 173),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: const Color.fromARGB(255, 0, 0, 0),
            icon: const Icon(Icons.search),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                color: const Color.fromARGB(255, 0, 0, 0),
                icon: const Icon(Icons.notifications),
              ),
              const Positioned(
                right: 15,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          )
        ],
        centerTitle: false,
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            // print("This is something");
          },
          color: const Color.fromARGB(255, 0, 0, 0),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 147, 173),
                borderRadius: BorderRadius.circular(16),
              ),
              height: 100,
              width: 200,
              child: const Center(
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ),
                        Image.network(
                          "https://www.indiafilings.com/learn/wp-content/uploads/2023/03/How-can-I-register-my-shop-and-establishment-online.jpg",
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Successfully added",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Your jkfv sdv dv sdf vds vdsv dasdasdsv sdv sd vsd v. Thank you",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 224, 147, 173),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          height: 50,
                          width: 5000,
                          child: const Center(
                            child: Text(
                              "Done",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 100,
              width: 200,
              child: const Center(
                child: Text(
                  "Dialog",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daily Summary Entry",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.ac_unit_outlined),
                                ),
                                const SizedBox(height: 5),
                                const Text('Ldsdf'),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.abc_rounded),
                                ),
                                const SizedBox(height: 5),
                                const Text('Musde'),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.access_alarm_sharp),
                                ),
                                const SizedBox(height: 5),
                                const Text('Nasd'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 105, 71, 83),
                borderRadius: BorderRadius.circular(16),
              ),
              height: 100,
              width: 200,
              child: const Center(
                child: Text(
                  "Bottom Sheet",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
