import 'package:get/get.dart';

import '../modules/all_carts/bindings/all_carts_binding.dart';
import '../modules/all_carts/views/all_carts_view.dart';
import '../modules/all_categories/bindings/all_categories_binding.dart';
import '../modules/all_categories/views/all_categories_view.dart';
import '../modules/all_products/bindings/all_products_binding.dart';
import '../modules/all_products/views/all_products_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/electronics/bindings/electronics_binding.dart';
import '../modules/electronics/views/electronics_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jwelery/bindings/jwelery_binding.dart';
import '../modules/jwelery/views/jwelery_view.dart';
import '../modules/log_in/bindings/log_in_binding.dart';
import '../modules/log_in/views/log_in_view.dart';
import '../modules/men-cloth/bindings/men_cloth_binding.dart';
import '../modules/men-cloth/views/men_cloth_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/products_by_category/bindings/products_by_category_binding.dart';
import '../modules/products_by_category/views/products_by_category_view.dart';
import '../modules/womens-cloth/bindings/womens_cloth_binding.dart';
import '../modules/womens-cloth/views/womens_cloth_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL =
      Routes.LOG_IN; // this page will be displayed first whenever opened

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ALL_PRODUCTS,
      page: () => const AllProductsView(),
      binding: AllProductsBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CATEGORIES,
      page: () => const AllCategoriesView(),
      binding: AllCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CARTS,
      page: () => const AllCartsView(),
      binding: AllCartsBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: '/products-by-category/:category',
      page: () => ProductsByCategoryView(),
    ),
    GetPage(
      name: _Paths.JWELERY,
      page: () => const JweleryView(),
      binding: JweleryBinding(),
    ),
    GetPage(
      name: _Paths.ELECTRONICS,
      page: () => const ElectronicsView(),
      binding: ElectronicsBinding(),
    ),
    GetPage(
      name: _Paths.WOMENS_CLOTH,
      page: () => const WomensClothView(),
      binding: WomensClothBinding(),
    ),
    GetPage(
      name: _Paths.MEN_CLOTH,
      page: () => const MenClothView(),
      binding: MenClothBinding(),
    ),
     
    
  ];
}
