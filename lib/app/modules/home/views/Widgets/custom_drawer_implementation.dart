import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_shop/app/modules/all_carts/views/all_carts_view.dart';
import 'package:smart_shop/app/modules/all_carts/views/all_carts_view.dart';
import 'package:smart_shop/app/modules/cart/views/cart_view.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget{
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("University of Chittagong"), accountEmail: Text('university@chittagong'),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: Image.network(
  "https://your-image-url.com/shop.png",
  fit: BoxFit.contain,
  width: 50,
  height: 50,
  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(child: CircularProgressIndicator());
  },
),

)),
            decoration: BoxDecoration(color: Colors.amber),
            
            
            ),
            

            ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Shop Items'),
        subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          Get.toNamed(Routes.ALL_CARTS);
        },
      ),


      ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Erina Akter'),
        subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          print('ListTile tapped!');
        },
      ),

      ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Erina Akter'),
        subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          print('ListTile tapped!');
        },
      ),

      Divider(),
      Spacer(),

      ListTile(
        leading: Icon(Icons.logout, color: Colors.red),
        title: Text('logout'),
        onTap: () {
          Navigator.pop(context);
        },
      ),



            
        ],
      ),
    );
  }
}