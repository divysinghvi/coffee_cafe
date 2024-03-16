import 'package:coffe_app/utility/coffee_tiles.dart';
import 'package:coffe_app/utility/coffee_type.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType = [
    [
      'Americano',
      true,
    ],
    [
      'Cappucino',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ]
  ];

  //user tapped on coffee Types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selection false
      for(int i = 0;i<coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        leading: Icon(Icons.menu),
        actions: [Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person)
        )],

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: ''
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: ''
          ),
        ],
      ),
      body: Column(
        children: [
          //find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best Coffee for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 56,
              ),
            ),
          ),
          SizedBox(height: 15,),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your perfect coffee..',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.grey.shade600
                    )
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.grey.shade600
                  )
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          //horizontal listview of coffee types
          Container(
            height: 50,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeType.length,
                itemBuilder: (context, index) {
              return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
              );
            })
          ),


          //horizontal listview finder
          Expanded(child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/icedlatte.jpg',
                coffeeName: 'Iced Americano',
                coffeePrice: '6.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/americano.jpg',
                coffeeName: 'Black',
                coffeePrice: '4.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/capechino.jpg',
                coffeeName: 'Cappuccino',
                coffeePrice: '5.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/chai.jpg',
                coffeeName: 'Chai',
                coffeePrice: '4.00',
              )

            ],
          ))
        ],
      ),
    );
  }
}
