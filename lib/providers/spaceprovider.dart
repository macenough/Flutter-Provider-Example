import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:providerexample/model/spacemodel.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier{
  late List<SpaceModel> _spaceModel;

   get getSpaceData async {
     await getSpaceApiData().then((value) {
       _spaceModel = value;
     });
     notifyListeners();
   }
  List<SpaceModel> get finalData {
     return _spaceModel;
   }

   Future<List<SpaceModel>> getSpaceApiData() async {
     var result;
     try {
       String url = "https://mocki.io/v1/e1897010-396e-404e-b0ed-8cbc04aebc5d";
       final responseData = await  http.get(Uri.parse(url));
       if (responseData.statusCode == 200) {
         final data = jsonDecode(responseData.body);
         print(data);
         Iterable list = data;
         return list
             .map((spaceModel) => SpaceModel.fromJson(spaceModel))
             .toList();
       }
     } catch (e) {
       log(e.toString());
     }
     return result;
     }
}