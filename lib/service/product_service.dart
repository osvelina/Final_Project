import 'package:dio/dio.dart';
import 'package:final_camp/model/product.dart';


class ApiService {
  final String baseUrl = "https://api.escuelajs.co/api/v1/products";
  final Dio dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        print("Failed to load products: ${response.statusCode}");
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Failed to load products: $e");
      throw Exception("Failed to load products: $e");
    }
  }
}
