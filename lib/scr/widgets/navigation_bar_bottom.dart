import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:proba/scr/providers/items_bottom_provider.dart';
import 'package:provider/provider.dart';

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({super.key});

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  @override
  Widget build(BuildContext context) {
    final itemsProvider =
        Provider.of<ItemsBottomProvider>(context, listen: false);
    return BottomNavigationBar(
        onTap: (value) {
          itemsProvider.currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        currentIndex: itemsProvider.currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xff4631D2),
        items: [
          BottomNavigationBarItem(
            label: 'Лента',
            icon: SvgPicture.asset(
              'assets/svg/svg1.svg',
              width: 18,
              height: 18,
              colorFilter: itemsProvider.currentIndex == 0
                  ? const ColorFilter.mode(Color(0xff4631D2), BlendMode.srcIn)
                  : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
              label: 'Карта',
              icon: SvgPicture.asset(
                'assets/svg/svg2.svg',
                width: 18,
                height: 18,
                colorFilter: itemsProvider.currentIndex == 1
                    ? const ColorFilter.mode(Color(0xff4631D2), BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              )),
          const BottomNavigationBarItem(
            label: 'Избранные',
            icon: FaIcon(FontAwesomeIcons.heart, size: 18),
          ),
          const BottomNavigationBarItem(
            label: 'Профиль',
            icon: FaIcon(
              FontAwesomeIcons.circleUser,
              size: 18,
            ),
          )
        ]);
  }
}
