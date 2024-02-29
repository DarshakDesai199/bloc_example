import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StoreRepo {
  static getStores() async {
    List storeDataList = [];

    try {
      http.Response response = await http.post(
        Uri.parse("https://api.gstreak.co/api/v1/store/find"),
        headers: {
          // 'Content-type': 'application/json',
          'Accept': 'application/json',
          'x-auth-token':
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMmQ3ZDhiYjA5NWEwMDUwMzVjMDY1YyIsImlhdCI6MTcwMTY4NjI1Mn0.aWOrnsmOVyMuGywiEC3bMgZEwdZG_huDYOJGf5Culrc",
        },
        body: {
          "page": '1',
          "limit": "20",
        },
      );
      debugPrint("response of API -=== ${response.body}");

      storeDataList = jsonDecode(response.body)['payload'];

      debugPrint("storeDataList **** ${storeDataList.length}");
      return storeDataList;
    } catch (e) {
      return [];
    }
  }

  static coinsUpdate() async {
    try {
      http.Response response = await http.put(
        Uri.parse("https://api.gstreak.co/api/v1/wallet/update"),
        headers: {
          // 'Content-type': 'application/json',
          'Accept': 'application/json',
          'x-auth-token':
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMmQ3ZDhiYjA5NWEwMDUwMzVjMDY1YyIsImlhdCI6MTcwMTY4NjI1Mn0.aWOrnsmOVyMuGywiEC3bMgZEwdZG_huDYOJGf5Culrc",
        },
        body: {
          "coins": '5',
        },
      );
      debugPrint("coinsUpdate response of API -=== ${jsonDecode(response.body)}");

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("${e.toString()}");

      return false;
    }
  }
}
