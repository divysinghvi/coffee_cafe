import 'package:flutter/material.dart';
import 'package:learning_widget/square.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){
    setState((){
      _selectedIndex = index;
    }
    );
  }
  final List _post =[
    'post 1',
    'post 2',
    'post 3',
    'post 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat),label:'chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:'person'),

        ],
      ),
      body: ListView.builder(
        itemCount: _post.length,
        itemBuilder: (context,index) {
          return MySquare(
            child: _post[index],
          );
        },
      ),
    );
  }
}
