import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:photo_gallery/models/image_model.dart';

class ImageServices {
  Future<List<ImageModel>> fetchImages(String query, int page) async {
    String key = '31735848-6d076837db8cdb70aa6ea5f29';
    String url =
        'https://pixabay.com/api/?key=$key&q=$query&image_type=photo&page=$page&per_page=20';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      print(response.body);
      return ((json.decode(response.body)['hits']) as List)
          .map((e) => ImageModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
