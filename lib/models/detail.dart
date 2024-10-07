class Dish {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String level;
  String thumbImg;
  String img;
  String totalTime;
  String metaImg;
  String author;
  String slug;
  // List<Food> foods;
  // List<Category> categories;
  // List<Ingredient> ingredients;
  // List<Step> steps;

  Dish({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.level,
    required this.thumbImg,
    required this.img,
    required this.totalTime,
    required this.metaImg,
    required this.author,
    required this.slug,
    // required this.foods,
    // required this.categories,
    // required this.ingredients,
    // required this.steps,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      createdAt:
          DateTime.parse(json['created_at'] ?? DateTime.now().toString()),
      updatedAt:
          DateTime.parse(json['updated_at'] ?? DateTime.now().toString()),
      name: json['name'] ?? '',
      level: json['level'] ?? '',
      thumbImg: json['thumb_img'] ?? '',
      img: json['img'] ?? '',
      totalTime: json['total_time'] ?? '',
      metaImg: json['meta_img'] ?? '',
      author: json['author'] ?? '',
      slug: json['slug'] ?? '',
      // foods:
      //     (json['foods'] as List?)?.map((i) => Food.fromJson(i)).toList() ?? [],
      // categories: (json['categories'] as List?)
      //         ?.map((i) => Category.fromJson(i))
      //         .toList() ??
      //     [],
      // ingredients: (json['ingredients'] as List?)
      //         ?.map((i) => Ingredient.fromJson(i))
      //         .toList() ??
      //     [],
      // steps:
      //     (json['steps'] as List?)?.map((i) => Step.fromJson(i)).toList() ?? [],
    );
  }
}

class Food {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  String name;
  Pivot pivot;

  Food({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.pivot,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Pivot {
  int foodId;
  int dishId;

  Pivot({
    required this.foodId,
    required this.dishId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      foodId: json['food_id'],
      dishId: json['dish_id'],
    );
  }
}

class Category {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  String name;
  int? parentId;
  Pivot pivot;

  Category({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    this.parentId,
    required this.pivot,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      parentId: json['parent_id'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}

class Ingredient {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int dishId;
  String name;
  String unit;
  int quantity;

  Ingredient({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.dishId,
    required this.name,
    required this.unit,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      dishId: json['dish_id'],
      name: json['name'] ?? '',
      unit: json['unit'] ?? '',
      quantity: json['quantity'] ?? 0.0,
    );
  }
}

class Step {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int dishId;
  String description;
  int order;
  List<Images> images;

  Step({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.dishId,
    required this.description,
    required this.order,
    required this.images,
  });

  factory Step.fromJson(Map<String, dynamic> json) {
    var imagesList = json['images'] as List;

    return Step(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      dishId: json['dish_id'] ?? '',
      description: json['description'] ?? '',
      order: json['order'] ?? '',
      images: imagesList.map((i) => Images.fromJson(i)).toList(),
    );
  }
}

class Images {
  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;
  int stepId;
  String img;

  Images({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.stepId,
    required this.img,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      stepId: json['step_id'],
      img: json['img'],
    );
  }
}
