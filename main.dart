import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HalamanBeranda();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'jelajah',
          builder: (BuildContext context, GoRouterState state) {
            return HalamanJelajah();
          },
        ),
        GoRoute(
          path: 'akun',
          builder: (BuildContext context, GoRouterState state) {
            return HalamanAkun();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Praktikum Navigasi',
      routerConfig: _router,
    );
  }
}

class HalamanBeranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Praktikum Navigasi'),
      ),
      endDrawer: Drawer(
        child: ListView(
          // Penting: Hilangkan semua padding dari ListView
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Image.network(
                "https://telkomuniversity.ac.id/wp-content/uploads/2019/03/Logo-Telkom-University-png-3430x1174.png",
              ),
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Lihat Koleksi'),
              onTap: () => context.go('/jelajah'),
            ),
            ListTile(
              leading: const Icon(Icons.man_3),
              title: const Text('Akun'),
              onTap: () => context.go('/akun'),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Ini adalah tampilan Halaman Beranda'),
      ),
    );
  }
}

class HalamanJelajah extends StatefulWidget {
  @override
  State<HalamanJelajah> createState() => _HalamanJelajahState();
}

class _HalamanJelajahState extends State<HalamanJelajah> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Halaman Koleksi')),
      body: const Center(
        child: Text('Ini adalah tampilan Halaman Lihat Koleksi'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Formal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Kasual',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Vintage',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}

class HalamanAkun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Akun'),
      ),
      body: const Center(
        child: Text('Ini adalah tampilan Halaman Akun'),
      ),
    );
  }
}