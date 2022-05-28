class Note {
  late int id;
  late String title;
  late String description;

  
  

  Note ( this.title,this.description);

  

  

  
  

  
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['description'] = description;
    

    return map;
  }


  Note.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
   
  }
}
