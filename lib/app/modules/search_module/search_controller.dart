import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/data/provider/local/session.dart';
import 'package:pea_chat/app/data/provider/remote/api.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class SearchController extends GetxController {
  var userSearchList = <User>[].obs;
  var tfUserSearchFocusNode = FocusNode();
  var tfUserSearchCtrl = TextEditingController();

  @override
  void onInit() {
    tfUserSearchCtrl.addListener(() {
      userSearchList.value = [];
      var query = dio.FormData();
      query.fields.add(MapEntry('query', tfUserSearchCtrl.text));
      Api.instance
          .searchUser(
              bearToken: Session.instance.tokenResp!.accessToken, query: query)
          .then((value) {
        userSearchList.assignAll(value!.result ?? []);
      });
    });

    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    tfUserSearchFocusNode.requestFocus();

    super.onReady();
  }
}
