import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/components/grocery_item_tile.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final name = Provider.of<CartModel>(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, // navigation bar color
        statusBarColor: Colors.white, // status bar color
        statusBarIconBrightness: Brightness.dark, // status bar icons' color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CartPage();
            },
          )),
          backgroundColor: Colors.black,
          child: const Icon(Icons.shopping_bag),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //good moring text
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        name.greeting(),
                        style: GoogleFonts.rubik(fontSize: 18.0),
                      ),
                    ),
                    Text(
                      ',',
                      style: GoogleFonts.rubik(fontSize: 18.0),
                    ),
                    Text(
                      name.name,
                      style: GoogleFonts.rubik(fontSize: 18.0),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.settings,
                    size: 24.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),

            //lets order fresh food for you
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Let\'s order fresh food for you',
                style: GoogleFonts.notoSerif(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                thickness: 1.0,
              ),
            ),
            //fresh items + grid
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Fresh Item',
                style: TextStyle(fontSize: 16),
              ),
            ),
            //make grid view here
            Expanded(
              child: Consumer<CartModel>(
                builder: ((context, value, child) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(12.0),
                    itemCount: value.shopItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.2),
                    itemBuilder: ((context, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                      );
                    }),
                  );
                }),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
