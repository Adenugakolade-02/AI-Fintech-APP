import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiManagement{

  final Uri predictUri = Uri.parse('https://smart-fintech.herokuapp.com/predict');
  final Uri scaleUri = Uri.parse('https://smart-fintech.herokuapp.com/scale');

  scaleData(dynamic data) async{
    var scaleResponse = await http.Client().post(scaleUri,body: json.encode(data),headers:{'content-type': 'application/json'});
    
    try{
      if(scaleResponse.statusCode==200){
        return json.decode(scaleResponse.body);
      }
    }
    catch(e){
      print(e);
    }
  }

  predictData(dynamic data) async{
     var predictResponse = await http.Client().post(predictUri,body: json.encode(data),headers:{'content-type': 'application/json'});
    
    try{
      if(predictResponse.statusCode==200){
        return json.decode(predictResponse.body);
      }
    }
    catch(e){
      print(e);
    }
  }

}
