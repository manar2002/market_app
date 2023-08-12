import 'package:flutter/material.dart';
import 'package:untitled/home.dart';
import '../constants.dart';
import '../widgets/my_text.dart';

class NavBarView extends StatefulWidget {
  String email;
  NavBarView({super.key, required this.email});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {

  int currentIndex = 0;

  List content = [
    ['shops', 'Shops', const HomePage()],
    ['search2', 'Explore', const Center(child: Text('Explore'))],
    ['cart', 'Cart', const Center(child: Text('Cart'))],
    ['heart', 'Favourite', const Center(child: Text('Favourite'))],
    ['user', 'Account', const Center(child: Text('Account'))],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content[currentIndex][2],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (v) {
          currentIndex = v;
          setState(() {});
        },
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kBlackColor,
        items: content.map((e) {
          final index = content.indexOf(e);
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(
                    getAsset(e[0]),
                    height: 30,
                    width: 30,
                    color: currentIndex == index ? kPrimaryColor : kBlackColor,
                  ),
                ),
                MyText(
                  data: e[1],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: currentIndex == index ? kPrimaryColor : kBlackColor,
                ),
              ],
            ),
            label: '',
          );
        }).toList(),
      ),
    );
  }
}
