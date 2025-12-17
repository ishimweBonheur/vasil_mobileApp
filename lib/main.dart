import 'package:flutter/material.dart';
import 'package:vasil_mobileapp/home_page.dart';
import 'package:vasil_mobileapp/profile_page.dart';
import 'package:vasil_mobileapp/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomePage(),
      
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPageIndex = 0;
  
  List<Widget> get pages => [
    const HomePage(),
    const ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Vasil'),
        backgroundColor: Colors.blue,
      ),
      body: pages[currentPageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating Action Button Pressed");
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}