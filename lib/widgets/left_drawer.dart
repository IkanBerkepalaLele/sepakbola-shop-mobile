import 'package:flutter/material.dart';
import 'package:sepakbola_shop/screens/menu.dart';
import 'package:sepakbola_shop/screens/productlist_form.dart';
import 'package:sepakbola_shop/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header with Logo and Close button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Logo
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SLOP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Arial',
                            color: Colors.green,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'SHOP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Arial',
                            color: Colors.black,
                            height: 1.0,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Close button
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 1),
            // Menu items
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                splashColor: Colors.green.shade100,
                highlightColor: Colors.green.shade50,
                child: ListTile(
                  leading: const Icon(Icons.home, color: Colors.black),
                  title: const Text('Halaman Utama'),
                ),
              ),
            ),
            const Divider(height: 1),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductFormPage(),
                    ),
                  );
                },
                splashColor: Colors.green.shade100,
                highlightColor: Colors.green.shade50,
                child: ListTile(
                  leading: const Icon(Icons.add, color: Colors.black),
                  title: const Text('Tambah Produk'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom AppBar with logo
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              // Logo/Title
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SLOP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Arial',
                      color: Colors.green,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'SHOP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Arial',
                      color: Colors.black,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Hamburger Menu Button
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}