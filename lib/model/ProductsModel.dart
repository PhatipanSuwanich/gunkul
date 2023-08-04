class ProductsModel {
  List<Products>? _products;
  int? _total;
  int? _skip;
  int? _limit;

  ProductsModel({List<Products>? products, int? total, int? skip, int? limit}) {
    if (products != null) {
      this._products = products;
    }
    if (total != null) {
      this._total = total;
    }
    if (skip != null) {
      this._skip = skip;
    }
    if (limit != null) {
      this._limit = limit;
    }
  }

  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;
  int? get total => _total;
  set total(int? total) => _total = total;
  int? get skip => _skip;
  set skip(int? skip) => _skip = skip;
  int? get limit => _limit;
  set limit(int? limit) => _limit = limit;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this._total;
    data['skip'] = this._skip;
    data['limit'] = this._limit;
    return data;
  }
}

class Products {
  int? _id;
  String? _title;
  String? _description;
  int? _price;
  double? _discountPercentage;
  double? _rating;
  int? _stock;
  String? _brand;
  String? _category;
  String? _thumbnail;
  List<String>? _images;

  Products(
      {int? id,
        String? title,
        String? description,
        int? price,
        double? discountPercentage,
        double? rating,
        int? stock,
        String? brand,
        String? category,
        String? thumbnail,
        List<String>? images}) {
    if (id != null) {
      this._id = id;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (price != null) {
      this._price = price;
    }
    if (discountPercentage != null) {
      this._discountPercentage = discountPercentage;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (stock != null) {
      this._stock = stock;
    }
    if (brand != null) {
      this._brand = brand;
    }
    if (category != null) {
      this._category = category;
    }
    if (thumbnail != null) {
      this._thumbnail = thumbnail;
    }
    if (images != null) {
      this._images = images;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get price => _price;
  set price(int? price) => _price = price;
  double? get discountPercentage => _discountPercentage;
  set discountPercentage(double? discountPercentage) =>
      _discountPercentage = discountPercentage;
  double? get rating => _rating;
  set rating(double? rating) => _rating = rating;
  int? get stock => _stock;
  set stock(int? stock) => _stock = stock;
  String? get brand => _brand;
  set brand(String? brand) => _brand = brand;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get thumbnail => _thumbnail;
  set thumbnail(String? thumbnail) => _thumbnail = thumbnail;
  List<String>? get images => _images;
  set images(List<String>? images) => _images = images;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _price = json['price'];
    _discountPercentage = json['discountPercentage'];
    _rating = json['rating'] + 0.0;
    _stock = json['stock'];
    _brand = json['brand'];
    _category = json['category'];
    _thumbnail = json['thumbnail'];
    _images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['title'] = this._title;
    data['description'] = this._description;
    data['price'] = this._price;
    data['discountPercentage'] = this._discountPercentage;
    data['rating'] = this._rating;
    data['stock'] = this._stock;
    data['brand'] = this._brand;
    data['category'] = this._category;
    data['thumbnail'] = this._thumbnail;
    data['images'] = this._images;
    return data;
  }
}
