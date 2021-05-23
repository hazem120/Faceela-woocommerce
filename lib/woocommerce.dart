import 'package:woocommerce/woocommerce.dart';

class WoocommerceApi {
  String category;
  WoocommerceApi({this.category});
  static WooCommerce prodMode = WooCommerce(
      baseUrl: 'https://faceela.com/ecommerce/',
      consumerKey: 'ck_ffaaba271e4fd0510160ec7fef5e1cd56ed27aa5',
      consumerSecret: 'cs_eabe4f07bd57cbc4cbe2de98681d260ed14eccc1');

  Future<List<WooProduct>> getMyProducts() async {
    final myProducts =
        await prodMode.getProducts(perPage: 20, category: category);

    return myProducts;
  }
}
