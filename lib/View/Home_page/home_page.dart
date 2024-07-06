import 'package:e_com_application/headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text("Home "),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.search);
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width * 0.92,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.shutterstock.com/image-photo/omni-channel-technology-online-retail-260nw-1564080871.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            20.ofh,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...image
                      .map(
                        (e) => Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(5, 5),
                                blurRadius: 5,
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                e,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            20.ofh,
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "All Products",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            20.ofh,
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 4 / 7,
                  mainAxisSpacing: 20,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.detail,
                        arguments: products[index]);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          image: NetworkImage(products[index]['thumbnail']),
                        ),
                        Text(
                          products[index]['category'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          products[index]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          "\$ ${products[index]['price']}".toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          products[index]['description'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                        Text(
                          "⭐ ${products[index]['rating']}".toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            // fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.profile);
        },
        child: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}

/*Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: products
                    .map(
                      (e) => Container(
                        height: 100,
                        width: 300,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(5, 5),
                              blurRadius: 5,
                            ),
                          ],
                          shape: BoxShape.circle,
                          color: Colors.white,
                          // image: DecorationImage(
                          //   image: NetworkImage(
                          //     e['thumbnail'],
                          //   ),
                          // ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),*/
