import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plants.dart';
import 'package:plant_app/ui/screens/detail_page.dart';

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
                // Lista Cards delle piante
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child:
                                DetailPage(plantId: plantList[index].plantId),
                            type: PageTransitionType.bottomToTop));
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.8),
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: IconButton(
                              onPressed: () {
                                bool isFavorited = toggleIsFavorited(
                                    plantList[index].isFavorated);
                                plantList[index].isFavorated = isFavorited;
                              },
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
                          top: 45,
                          bottom: 55,
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
                  ),
                );
              },
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text('New Plants',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0))),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: plantList.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    // Card Container
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: DetailPage(
                                    plantId: plantList[index].plantId),
                                type: PageTransitionType.bottomToTop));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Constants.primaryColor.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        height: 80,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        margin: const EdgeInsets.only(bottom: 10, top: 10),
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                      color: Constants.primaryColor
                                          .withOpacity(.8),
                                      shape: BoxShape.circle),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 80.0,
                                    child:
                                        Image.asset(plantList[index].imageURL),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(plantList[index].category),
                                      Text(
                                        plantList[index].plantName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Constants.blackColor,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                    r'$' + plantList[index].price.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        color: Constants.primaryColor)))
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
