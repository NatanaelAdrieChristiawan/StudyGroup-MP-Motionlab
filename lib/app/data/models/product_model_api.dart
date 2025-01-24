// product_model_api.dart

import 'dart:convert';

// Fungsi untuk konversi JSON string ke model Product
Product productFromJson(String str) => Product.fromJson(json.decode(str));

// Fungsi untuk konversi model Product ke JSON string
String productToJson(Product data) => json.encode(data.toJson());

// Model utama Product
class Product {
  List<ProductElement>? products;
  int? total;
  int? skip;
  int? limit;

  Product({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  // Parsing JSON ke model
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: (json["products"] as List<dynamic>?)
            ?.map((e) => ProductElement.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json["total"] as int? ?? 0,
        skip: json["skip"] as int? ?? 0,
        limit: json["limit"] as int? ?? 0,
      );

  // Konversi model ke JSON
  Map<String, dynamic> toJson() => {
        "products": products?.map((e) => e.toJson()).toList() ?? [],
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

// Model untuk elemen produk
class ProductElement {
  int? id;
  String? title;
  String? description;
  String? category; // Gunakan String untuk fleksibilitas
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  ProductElement({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  // Parsing JSON ke model
  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["id"] as int?,
        title: json["title"] as String? ?? 'No Title',
        description: json["description"] as String? ?? '',
        category: json["category"] as String?, // Tidak gunakan enum
        price: (json["price"] as num?)?.toDouble() ?? 0.0,
        discountPercentage: (json["discountPercentage"] as num?)?.toDouble(),
        rating: (json["rating"] as num?)?.toDouble(),
        stock: json["stock"] as int? ?? 0,
        tags: (json["tags"] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        brand: json["brand"] as String?,
        sku: json["sku"] as String?,
        weight: json["weight"] as int?,
        dimensions: json["dimensions"] != null
            ? Dimensions.fromJson(json["dimensions"] as Map<String, dynamic>)
            : null,
        warrantyInformation: json["warrantyInformation"] as String?,
        shippingInformation: json["shippingInformation"] as String?,
        availabilityStatus: json["availabilityStatus"] as String?,
        reviews: (json["reviews"] as List<dynamic>?)
            ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
            .toList(),
        returnPolicy: json["returnPolicy"] as String?,
        minimumOrderQuantity: json["minimumOrderQuantity"] as int? ?? 1,
        meta: json["meta"] != null
            ? Meta.fromJson(json["meta"] as Map<String, dynamic>)
            : null,
        images: (json["images"] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        thumbnail: json["thumbnail"] as String?,
      );

  // Konversi model ke JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": tags ?? [],
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformation,
        "availabilityStatus": availabilityStatus,
        "reviews": reviews?.map((e) => e.toJson()).toList() ?? [],
        "returnPolicy": returnPolicy,
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta?.toJson(),
        "images": images ?? [],
        "thumbnail": thumbnail,
      };
}

// Model untuk dimensi produk
class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: (json["width"] as num?)?.toDouble(),
        height: (json["height"] as num?)?.toDouble(),
        depth: (json["depth"] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
      };
}

// Model untuk informasi tambahan produk
class Meta {
  DateTime? createdAt;
  DateTime? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : null,
        barcode: json["barcode"] as String?,
        qrCode: json["qrCode"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
      };
}

// Model untuk ulasan produk
class Review {
  int? rating;
  String? comment;
  DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"] as int?,
        comment: json["comment"] as String?,
        date: json["date"] != null ? DateTime.parse(json["date"]) : null,
        reviewerName: json["reviewerName"] as String?,
        reviewerEmail: json["reviewerEmail"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date?.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
      };
}
