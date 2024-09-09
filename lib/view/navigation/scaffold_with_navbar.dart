import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavbar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithNavbar({super.key, required this.child});

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Bored",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          centerTitle: true),
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (int newIndex) {
          setState(() {
            index = newIndex;
          });
          switch (index) {
            case 1:
              context.go("/favorites");
              break;
            case _:
              context.go("/");
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}
