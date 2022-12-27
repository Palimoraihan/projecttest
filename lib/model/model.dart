class MainModel {
  List<ItemM> listModel;

  MainModel({required this.listModel});

  factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        listModel: List<ItemM>.from(
          (json["items"] as List).map((e) => ItemM.fromJson(e)).where((data) =>
              data.name != null &&
              data.description != null),
        ),
      );
}

class ItemM {
  final String? description;
  final String? name;
  final String? language;
  final String? owner;
  final int? whaches;
 

  ItemM({required this.description, required this.name,required this.language, required this.whaches,required this.owner});

  factory ItemM.fromJson(Map<String, dynamic> json) => ItemM(
      description: json['description'],
      name: json['name'], 
      language: json['language'], 
      whaches:json['watchers_count'],
      owner: json ['owner']['login'],
      
   );
}

