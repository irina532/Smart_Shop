import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smart_shop/app/modules/all_carts/views/all_carts_view.dart';
import 'package:smart_shop/app/modules/all_carts/views/all_carts_view.dart';
import 'package:smart_shop/app/modules/cart/views/cart_view.dart';
import 'package:smart_shop/app/modules/home/controllers/home_controller.dart';
import 'package:smart_shop/app/routes/app_pages.dart';

class CustomDrawer extends StatelessWidget{
  final controller = Get.find<HomeController>();
   CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(""), 
            accountEmail: Text(user?.email ?? '',style: const TextStyle(fontSize: 14),),
            currentAccountPicture: CircleAvatar(
              radius: 40,
              child: CircleAvatar(
                child: Image(
  image: NetworkImage("https://banner2.cleanpng.com/cb2/slq/ooq/atux8lmd1.webp"),
  fit: BoxFit.contain,
  width: 50,
  height: 50,
  errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(child: CircularProgressIndicator());
  },
)



)),
            decoration: BoxDecoration(color: Colors.amber),
            
            
            ),
            

            ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Shop Items'),
        //subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          Get.toNamed(Routes.ALL_CARTS);
        },
      ),


      ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Pay'),
        //subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.money, color: Colors.grey),
        tileColor: Colors.blue.shade50,
        onTap: () {
          print('ListTile tapped!');
        },
      ),

      ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('Cart'),
        //subtitle: Text('Flutter Developer'),
        trailing: Icon(Icons.shopping_cart, color: Colors.grey),
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
        onTap: () async {
          Navigator.pop(context); // close drawer
                  await controller.mLogout(); // ✅ LOGOUT FROM CONTROLLER
              Get.offAllNamed(Routes.LOG_IN);
        },
      ),



            
        ],
      ),
    );
  }
}