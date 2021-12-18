class ProductsModel {
  ProductsModel({
    this.cap,
    this.coatpant,
    this.glasses,
    this.kurta,
    this.pant,
    this.sherwani,
    this.shirt,
    this.shoes,
    this.watch,
    this.winterjacket,
  });

  ProductsModel.fromJson(dynamic json) {
    if (json['cap'] != null) {
      cap = [];
      json['cap'].forEach((v) {
        cap?.add(Cap.fromJson(v));
      });
    }
    if (json['coatpant'] != null) {
      coatpant = [];
      json['coatpant'].forEach((v) {
        coatpant?.add(Coatpant.fromJson(v));
      });
    }
    if (json['glasses'] != null) {
      glasses = [];
      json['glasses'].forEach((v) {
        glasses?.add(Glasses.fromJson(v));
      });
    }
    if (json['kurta'] != null) {
      kurta = [];
      json['kurta'].forEach((v) {
        kurta?.add(Kurta.fromJson(v));
      });
    }
    if (json['pant'] != null) {
      pant = [];
      json['pant'].forEach((v) {
        pant?.add(Pant.fromJson(v));
      });
    }
    if (json['sherwani'] != null) {
      sherwani = [];
      json['sherwani'].forEach((v) {
        sherwani?.add(Sherwani.fromJson(v));
      });
    }
    if (json['shirt'] != null) {
      shirt = [];
      json['shirt'].forEach((v) {
        shirt?.add(Shirt.fromJson(v));
      });
    }
    if (json['shoes'] != null) {
      shoes = [];
      json['shoes'].forEach((v) {
        shoes?.add(Shoes.fromJson(v));
      });
    }
    if (json['watch'] != null) {
      watch = [];
      json['watch'].forEach((v) {
        watch?.add(Watch.fromJson(v));
      });
    }
    if (json['winterjacket'] != null) {
      winterjacket = [];
      json['winterjacket'].forEach((v) {
        winterjacket?.add(Winterjacket.fromJson(v));
      });
    }
  }

  List<Cap>? cap;
  List<Coatpant>? coatpant;
  List<Glasses>? glasses;
  List<Kurta>? kurta;
  List<Pant>? pant;
  List<Sherwani>? sherwani;
  List<Shirt>? shirt;
  List<Shoes>? shoes;
  List<Watch>? watch;
  List<Winterjacket>? winterjacket;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cap != null) {
      map['cap'] = cap?.map((v) => v.toJson()).toList();
    }
    if (coatpant != null) {
      map['coatpant'] = coatpant?.map((v) => v.toJson()).toList();
    }
    if (glasses != null) {
      map['glasses'] = glasses?.map((v) => v.toJson()).toList();
    }
    if (kurta != null) {
      map['kurta'] = kurta?.map((v) => v.toJson()).toList();
    }
    if (pant != null) {
      map['pant'] = pant?.map((v) => v.toJson()).toList();
    }
    if (sherwani != null) {
      map['sherwani'] = sherwani?.map((v) => v.toJson()).toList();
    }
    if (shirt != null) {
      map['shirt'] = shirt?.map((v) => v.toJson()).toList();
    }
    if (shoes != null) {
      map['shoes'] = shoes?.map((v) => v.toJson()).toList();
    }
    if (watch != null) {
      map['watch'] = watch?.map((v) => v.toJson()).toList();
    }
    if (winterjacket != null) {
      map['winterjacket'] = winterjacket?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Winterjacket {
  Winterjacket({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Winterjacket.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Watch {
  Watch({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Watch.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Shoes {
  Shoes({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Shoes.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Shirt {
  Shirt({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Shirt.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Sherwani {
  Sherwani({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Sherwani.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Pant {
  Pant({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Pant.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Kurta {
  Kurta({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Kurta.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Glasses {
  Glasses({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Glasses.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Coatpant {
  Coatpant({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Coatpant.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}

class Cap {
  Cap({
    this.name,
    this.image,
    this.price,
    this.description,
  });

  Cap.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  String? name;
  String? image;
  String? price;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['price'] = price;
    map['description'] = description;
    return map;
  }
}
