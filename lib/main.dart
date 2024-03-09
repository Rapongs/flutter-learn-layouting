import 'package:flutter/material.dart';

var recipeType = ["Semua", "Makanan", "Minuman", "Dessert"];
var foodLogo = ["fast-food.png", "hamburger.png", "drink.png", "cupcake.png"];
var selectedType = 0;
var foodRecipe = [
  {
    "gambar": "burger.jpeg",
    "nama": "Beef Burger",
    "durasi": "30 menit",
  },
  {
    "gambar": "pie.jpeg",
    "nama": "Apple Pie",
    "durasi": "50 menit",
  },
  {
    "gambar": "ramen.jpeg",
    "nama": "Ramen",
    "durasi": "15 menit",
  },
  {
    "gambar": "karage.jpeg",
    "nama": "Chicken Karage",
    "durasi": "30 menit",
  },
  {
    "gambar": "takoyaki.jpeg",
    "nama": "Takoyaki",
    "durasi": "10 menit",
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _recipeTitle(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerContent(),
              _recipeType(),
              _recipeList(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange[900],
        child: const Text(
          "+",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  Container _recipeList() {
    return Container(
        alignment: Alignment.center,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              mainAxisExtent: 200),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.grey[300],
                border: Border.all(
                    color: const Color.fromARGB(255, 224, 224, 224))),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    "images/${foodRecipe.elementAt(index)['gambar']}",
                    width: double.infinity,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "${foodRecipe.elementAt(index)['nama']}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        size: 15,
                      ),
                      Text("${foodRecipe.elementAt(index)['durasi']}"),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 5,
        ));
  }

  Container _headerContent() {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Katalog Resep Makanan",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Icon(
            Icons.settings,
            color: Colors.orange[900],
          ),
        ],
      ),
    );
  }

  Container _recipeType() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: 35,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            width: 130,
            decoration: BoxDecoration(
                color:
                    selectedType == index ? Colors.orange[900] : Colors.white,
                border: selectedType == index
                    ? null
                    : Border.all(color: const Color.fromARGB(255, 230, 81, 0)),
                borderRadius: BorderRadius.circular(8)),
            child: _isiBoxRecipeType(index),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: recipeType.length,
        ),
      ),
    );
  }

  Row _isiBoxRecipeType(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("images/${foodLogo[index]}"),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        Text(
          recipeType[index],
          style: TextStyle(
              color: selectedType == index ? Colors.white : Colors.black),
        ),
      ],
    );
  }

  Row _recipeTitle() {
    return Row(
      children: [
        Image.asset("images/logo.png"),
        const Padding(padding: EdgeInsets.only(right: 10)),
        const SizedBox(
          width: 230,
          height: 37,
          child: SearchBar(
            // constraints: BoxConstraints(maxWidth: 230, minHeight: 35),
            hintText: "Search",
            leading: Icon(Icons.search),
          ),
        )
      ],
    );
  }
}
