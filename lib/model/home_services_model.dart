class ServicesModel {
  List<HomeServicesData>? homeServicesData;
  String? message;
  bool? status;

  ServicesModel.fromJson(Map<String, dynamic> json){
    homeServicesData = List.from(json['data']).map((e)=>HomeServicesData.fromJson(e)).toList();
    message = json['message'];
    status = json['status'];
  }

}

class HomeServicesData {

  int? id;
  String? title;
  String? description;
  String? image;
  String? category;
  int? price;

  HomeServicesData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    category = json['category'];
    price = json['price'];
  }
}