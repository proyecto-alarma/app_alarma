import 'package:flutter/material.dart';
import 'package:project/src/ui/pages/collaborators/add_collaborators.dart';
import 'package:project/src/ui/pages/collaborators/collaboators_page.dart';
import 'package:project/src/ui/pages/home/home_page.dart';
import 'package:project/src/ui/views/loadin.dart';

import '../../core/shared/emtters.dart';

class HomePageDart extends StatefulWidget {
  const HomePageDart({super.key});

  @override
  State<HomePageDart> createState() => _HomePageDartState();
}

class _HomePageDartState extends State<HomePageDart> {
  int _currentIndex = 0;
  late Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: _size.width * .04,
              ),
              child: FutureBuilder(
                future: _currentPage(),
                builder: (_, snp) {
                  if (!snp.hasData) {
                    return const SizedBox();
                  }
                  return snp.data!;
                },
              ),
            ),
            StreamBuilder<bool>(
                stream: getStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SizedBox();
                  }
                  return snapshot.data!
                      ? const LoadingView()
                      : const SizedBox();
                }),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.home),
                color: Colors.red,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.person_outlined),
                color: Colors.red,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.add_circle_outline),
                color: Colors.red,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.abc),
                color: Colors.red,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                (Icons.settings),
                color: Colors.red,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }

  Future<Widget> _currentPage() async {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CollaboratorPage();
      case 2:
        return AddCollaborators();
      case 3:
        return SizedBox(
          child: Text("3"),
        );
      case 4:
        return SizedBox(
          child: Text("4"),
        );
      default:
        return const SizedBox();
    }
  }
}
