import 'package:get_storage/get_storage.dart';

class MLocalStorage {
  static final MLocalStorage _instance = MLocalStorage._internal();

  factory MLocalStorage() {
    return _instance;
  }

  MLocalStorage._internal();

  final _storage=GetStorage();

  //--------------GEneric Method to save Data----------//
  Future<void> saveData<T>(String key, T value)async{
    await _storage.write(key, value);
  }

  //-----------------Generic method to read data---------------//
  T? readData<T>(String key){
    return _storage.read(key);
  }

//--------------------Generic mehod to remove data------------//
  Future<void> removeData<T>(String key) async{
    await _storage.remove(key);
  }


//--------------------Generic mehod to clear all data------------//
  Future<void> clearAll() async{
    await _storage.erase();
  }

}
