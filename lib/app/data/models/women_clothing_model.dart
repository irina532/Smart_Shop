class WomenClothModel {
    WomenClothModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
    });

    final int id;
    final String title;
    final double price;
    final String description;
    final String category;
    final String image;
    final Rating? rating;

    factory WomenClothModel.fromJson(Map<String, dynamic> json){ 
        return WomenClothModel(
            id: json["id"] ?? 0,
            title: json["title"] ?? "",
            price: json["price"] ?? 0.0,
            description: json["description"] ?? "",
            category: json["category"] ?? "",
            image: json["image"] ?? "",
            rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
    };

    @override
    String toString(){
        return "$id, $title, $price, $description, $category, $image, $rating, ";
    }

}

class Rating {
    Rating({
        required this.rate,
        required this.count,
    });

    final double rate;
    final int count;

    factory Rating.fromJson(Map<String, dynamic> json){ 
        return Rating(
            rate: json["rate"] ?? 0.0,
            count: json["count"] ?? 0,
        );
    }

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };

    @override
    String toString(){
        return "$rate, $count, ";
    }

}

/*
[
	{
		"id": 15,
		"title": "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats",
		"price": 56.99,
		"description": "Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates",
		"category": "women's clothing",
		"image": "https://fakestoreapi.com/img/51Y5NI-I5jL.AC_UX679.jpg",
		"rating": {
			"rate": 2.6,
			"count": 235
		}
	},
	{
		"id": 16,
		"title": "Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket",
		"price": 29.95,
		"description": "100% POLYURETHANE(shell) 100% POLYESTER(lining) 75% POLYESTER 25% COTTON (SWEATER), Faux leather material for style and comfort / 2 pockets of front, 2-For-One Hooded denim style faux leather jacket, Button detail on waist / Detail stitching at sides, HAND WASH ONLY / DO NOT BLEACH / LINE DRY / DO NOT IRON",
		"category": "women's clothing",
		"image": "https://fakestoreapi.com/img/81XH0e8fefL.AC_UY879.jpg",
		"rating": {
			"rate": 2.9,
			"count": 340
		}
	},
	{
		"id": 17,
		"title": "Rain Jacket Women Windbreaker Striped Climbing Raincoats",
		"price": 39.99,
		"description": "Lightweight perfet for trip or casual wear---Long sleeve with hooded, adjustable drawstring waist design. Button and zipper front closure raincoat, fully stripes Lined and The Raincoat has 2 side pockets are a good size to hold all kinds of things, it covers the hips, and the hood is generous but doesn't overdo it.Attached Cotton Lined Hood with Adjustable Drawstrings give it a real styled look.",
		"category": "women's clothing",
		"image": "https://fakestoreapi.com/img/71HblAHs5xL.AC_UY879-2.jpg",
		"rating": {
			"rate": 3.8,
			"count": 679
		}
	},
	{
		"id": 18,
		"title": "MBJ Women's Solid Short Sleeve Boat Neck V ",
		"price": 9.85,
		"description": "95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach, Lightweight fabric with great stretch for comfort, Ribbed on sleeves and neckline / Double stitching on bottom hem",
		"category": "women's clothing",
		"image": "https://fakestoreapi.com/img/71z3kpMAYsL.AC_UY879.jpg",
		"rating": {
			"rate": 4.7,
			"count": 130
		}
	},
	{
		"id": 19,
		"title": "Opna Women's Short Sleeve Moisture",
		"price": 7.95,
		"description": "100% Polyester, Machine wash, 100% cationic polyester interlock, Machine Wash & Pre Shrunk for a Great Fit, Lightweight, roomy and highly breathable with moisture wicking fabric which helps to keep moisture away, Soft Lightweight Fabric with comfortable V-neck collar and a slimmer fit, delivers a sleek, more feminine silhouette and Added Comfort",
		"category": "women's clothing",
		"image": "https://fakestoreapi.com/img/51eg55uWmdL.AC_UX679.jpg",
		"rating": {
			"rate": 4.5,
			"count": 146
		}
	},
	{
		"id": 20,
		"title": "DANVOUY Womens T Shirt Casual Cotton Short",
		"price": 12.99,
		"description": "95%Cotton,5%Spandex, Features: Casual, Short Sleeve, Letter Print,V-Neck,Fashion Tees, The fabric is soft and has some stretch., Occasion: Casual/Office/Beach/School/Home/Street. Season: Spring,Summer,Autumn,Winter.",
		"category": "women's clothing",
		"image": "https://fakestoreapi.com/img/61pHAEJ4NML.AC_UX679.jpg",
		"rating": {
			"rate": 3.6,
			"count": 145
		}
	}
]*/