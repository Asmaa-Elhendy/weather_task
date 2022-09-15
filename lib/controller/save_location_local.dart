import 'package:get_storage/get_storage.dart';

class LocalStore{

  final getStorage = GetStorage();

  saveLocation(lat,long)async{
      await  getStorage.write('lat', lat);
      await  getStorage.write('long', long);
    }



Future get lat async{
  return await getStorage.read('lat');
}
  Future get long async{
    return await getStorage.read('long');
  }
}