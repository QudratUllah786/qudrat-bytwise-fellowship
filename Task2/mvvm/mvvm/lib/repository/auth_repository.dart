import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/components/app_url.dart';

import '../data/network/BaseApiServices.dart';

class AuthRepository{

    /// _apiServices give me the access of NetworkApi Class
  BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
  }
  catch(e){
      throw e;
  }
  }
  Future<dynamic> registerApi(dynamic data)async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
      return response;
    }
    catch(e){
      throw e;
    }
  }
}