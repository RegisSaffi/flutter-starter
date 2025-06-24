import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageNotifier extends Notifier<String?> {
  @override
  build() {
    return null;
  }

  Future<bool> checkLoginInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString("email");
    state = email;
    return email != null;
  }

  saveLoginInfo(String email) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("email", email);
    state = email;
  }

  logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("email");
    state = null;
  }
}

var storageProvider = NotifierProvider<StorageNotifier, String?>(
  () => StorageNotifier(),
);
