class hotelItems {
  String itemName;
  String description;
  int amount;
  String imgPath;
  int index;

  hotelItems();

  hotelItems.Map(dynamic obj) {
    this.itemName = obj['itemName'];
    this.description = obj['description'];
    this.amount = obj['amount'];
    this.imgPath = obj['imgPath'];
    this.index = obj['index'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['itemName'] = itemName;
    map['description'] = description;
    map['amount'] = amount;
    map['imgPath'] = imgPath;
    map['index'] = index;
  }
}
