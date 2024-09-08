import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storapp/helper/Api.dart';
import 'package:storapp/models/Product_model.dart';

class porductser {
  Future<List<ProductCard>> fetchProducts() async {
    try {
      final response =
          await Api().Get(url: 'https://fakestoreapi.com/products');
      //print(response.body);

      final List<dynamic> jsonData = json.decode(response.body);
      List<ProductCard> data = [];
      if (response.statusCode == 200) {
        for (var i = 0; i < jsonData.length; i++) {
          data.add(ProductCard.fromJson(jsonData[i]));
        }
        return data;
      } else {
        throw ('${response.statusCode}');
      }
    } catch (e) {
      throw (e);
    }
  }
}
