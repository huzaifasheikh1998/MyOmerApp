import 'package:flutter/material.dart';
import 'package:mvvm/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _loginIdKey = 'loginId';
const String _tokenIdKey = 'tokenId';

setLoginId(String loginId) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(_loginIdKey, loginId);
  return getLoginId();
}

setTokenId(String tokenId) async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString(_tokenIdKey, tokenId);
}

getLoginId() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  loginId = pref.getString(_loginIdKey).toString();
  return loginId;
}

getTokenId() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  tokenId = pref.getString(_tokenIdKey).toString();
}
