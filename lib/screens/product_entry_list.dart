import 'package:flutter/material.dart';
import 'package:sepakbola_shop/models/product_entry.dart';
import 'package:sepakbola_shop/widgets/left_drawer.dart';
import 'package:sepakbola_shop/screens/product_detail.dart';
import 'package:sepakbola_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';


class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  bool showMyProducts = false; // Toggle between all products and my products

  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get('http://localhost:8000/json/');
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }

    // Filter by logged-in user if showMyProducts is true
    if (showMyProducts && request.jsonData['userId'] != null) {
      int loggedInUserId = request.jsonData['userId'];
      listProduct = listProduct.where((product) => product.userId == loggedInUserId).toList();
    }
    
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: CustomAppBar(),
      endDrawer: const LeftDrawer(),
      body: Column(
        children: [
          // Toggle buttons
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showMyProducts = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !showMyProducts ? Colors.green : Colors.grey.shade300,
                      foregroundColor: !showMyProducts ? Colors.white : Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'All Products',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showMyProducts = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: showMyProducts ? Colors.green : Colors.grey.shade300,
                      foregroundColor: showMyProducts ? Colors.white : Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'My Products',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product list
          Expanded(
            child: FutureBuilder(
              key: ValueKey(showMyProducts), // Force rebuild when toggle changes
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          'There are no product in SepakbolaShop yet.',
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: snapshot.data![index],
                        onTap: () {
                          // Navigate to product detail page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: snapshot.data![index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}