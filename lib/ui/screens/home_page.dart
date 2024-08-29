import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> plantList = Plant.plantList;

    // Plants Category
    List<String> plantCategories = [
      'Reccomended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    // Toggle Favorite button
    bool toggleIsFavorited(bool isFavorited) {
      return !isFavorited;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Input di Ricerca
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: size.width * .9,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search, color: Colors.black54.withOpacity(.6)),
                      const Expanded(
                          child: TextField(
                              showCursor: false,
                              decoration: InputDecoration(
                                  hintText: 'Search Plants',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none))),
                      Icon(Icons.mic, color: Colors.black54.withOpacity(.6))
                    ],
                  ),
                ),
                // Lista Categorie
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50.0,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plantCategories.length,
              itemBuilder: (BuildContext context, int index) {
                // Qui viene creato l'elemento della lista che poi viene looppato
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Text(
                      plantCategories[index],
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
              itemCount: plantList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 300,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(plantList[index].isFavorated
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: Constants.primaryColor,
                            iconSize: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        right: 50,
                        top: 50,
                        bottom: 50,
                        child: Image.asset(plantList[index].imageURL),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              plantList[index].category,
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                            Text(
                              plantList[index].plantName,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          bottom: 15,
                          right: 20,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                                r'$' + plantList[index].price.toString(),
                                style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontSize: 16)),
                          ))
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
