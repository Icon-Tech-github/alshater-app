class Category {
  final String name;
  final String imageUrl;
  final List<Subcategory> subcategories;

  const Category({
    required this.name,
    required this.imageUrl,
    required this.subcategories,
  });
}

class Subcategory {
  final String name;
  final String imageUrl;
  final List<Product> products;

  const Subcategory({
    required this.name,
    required this.imageUrl,
    required this.products,
  });
}

class Product {
  final String name;
  final String brand;
  final String brandImage;
  final String size;
  final List<String> sizes;
  final double price;
  final String imageUrl;

  const Product({
    required this.name,
    required this.brand,
    required this.brandImage,
    required this.size,
    this.sizes = const [],
    required this.price,
    required this.imageUrl,
  });
}

class Brand {
  final String name;
  final String imageUrl;

  const Brand({required this.name, required this.imageUrl});
}

const List<Category> categories = [
  Category(
    name: 'البسكويت والحلويات',
    imageUrl:
    'https://wallpapers.com/images/hd/cadbury-chocolate-selection-pack-8xa9go5fu7kdmziv-2.jpg',
    subcategories: [
      Subcategory(
        name: 'شوكولاتة',
        imageUrl:
        'https://corona.eg/wp-content/uploads/2023/10/dark-range-stevia.png',
        products: [
          Product(
            name: 'مارس',
            brand: 'Mars',
            brandImage:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
            size: '51 جم',
            price: 4.5,
            imageUrl:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
          ),
          Product(
            name: 'كيت كات',
            brand: 'Nestlé',
            brandImage:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
            size: '40 جم',
            price: 3.75,
            imageUrl:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
          ),
          Product(
            name: 'بيج تويك',
            brand: 'Twix',
            brandImage:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
            size: '50 جم',
            price: 4.0,
            imageUrl:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'بسكويت',
        imageUrl: 'https://elabdfoods.com/images/thumbs/0001345_-36-_550.png',
        products: [
          Product(
            name: 'أوريو',
            brand: 'Oreo',
            brandImage: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
            size: '38 جم',
            price: 2.75,
            imageUrl: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
          ),
          Product(
            name: 'مولتو',
            brand: 'Molto',
            brandImage:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
            size: '45 جم',
            price: 3.25,
            imageUrl:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
          ),
        ],
      ),
      Subcategory(
        name: 'مصاصة',
        imageUrl:
        'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
        products: [
          Product(
            name: 'هابي فروتس',
            brand: 'Happy Fruits',
            brandImage:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
            size: '4 قطع',
            price: 5.0,
            imageUrl:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
          ),
        ],
      ),
      Subcategory(
        name: 'شوكولاتة',
        imageUrl:
        'https://corona.eg/wp-content/uploads/2023/10/dark-range-stevia.png',
        products: [
          Product(
            name: 'مارس',
            brand: 'Mars',
            brandImage:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
            size: '51 جم',
            price: 4.5,
            imageUrl:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
          ),
          Product(
            name: 'كيت كات',
            brand: 'Nestlé',
            brandImage:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
            size: '40 جم',
            price: 3.75,
            imageUrl:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
          ),
          Product(
            name: 'بيج تويك',
            brand: 'Twix',
            brandImage:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
            size: '50 جم',
            price: 4.0,
            imageUrl:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'بسكويت',
        imageUrl: 'https://elabdfoods.com/images/thumbs/0001345_-36-_550.png',
        products: [
          Product(
            name: 'أوريو',
            brand: 'Oreo',
            brandImage: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
            size: '38 جم',
            price: 2.75,
            imageUrl: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
          ),
          Product(
            name: 'مولتو',
            brand: 'Molto',
            brandImage:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
            size: '45 جم',
            price: 3.25,
            imageUrl:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
          ),
        ],
      ),
      Subcategory(
        name: 'مصاصة',
        imageUrl:
        'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
        products: [
          Product(
            name: 'هابي فروتس',
            brand: 'Happy Fruits',
            brandImage:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
            size: '4 قطع',
            price: 5.0,
            imageUrl:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
          ),
        ],
      ),
      Subcategory(
        name: 'شوكولاتة',
        imageUrl:
        'https://corona.eg/wp-content/uploads/2023/10/dark-range-stevia.png',
        products: [
          Product(
            name: 'مارس',
            brand: 'Mars',
            brandImage:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
            size: '51 جم',
            price: 4.5,
            imageUrl:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
          ),
          Product(
            name: 'كيت كات',
            brand: 'Nestlé',
            brandImage:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
            size: '40 جم',
            price: 3.75,
            imageUrl:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
          ),
          Product(
            name: 'بيج تويك',
            brand: 'Twix',
            brandImage:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
            size: '50 جم',
            price: 4.0,
            imageUrl:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'بسكويت',
        imageUrl: 'https://elabdfoods.com/images/thumbs/0001345_-36-_550.png',
        products: [
          Product(
            name: 'أوريو',
            brand: 'Oreo',
            brandImage: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
            size: '38 جم',
            price: 2.75,
            imageUrl: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
          ),
          Product(
            name: 'مولتو',
            brand: 'Molto',
            brandImage:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
            size: '45 جم',
            price: 3.25,
            imageUrl:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
          ),
        ],
      ),
      Subcategory(
        name: 'مصاصة',
        imageUrl:
        'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
        products: [
          Product(
            name: 'هابي فروتس',
            brand: 'Happy Fruits',
            brandImage:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
            size: '4 قطع',
            price: 5.0,
            imageUrl:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
          ),
        ],
      ),
    ],
  ),
  Category(
    name: 'المشروبات',
    imageUrl:
    'https://littlecaesarsksa.com/wp-content/uploads/2018/07/92X92-04.png',
    subcategories: [
      Subcategory(
        name: 'مياه',
        imageUrl:
        'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
        products: [
          Product(
            name: 'مياه طبيعية',
            brand: 'Nestlé Pure Life',
            brandImage: 'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
            size: '1.5 لتر',
            price: 2.5,
            imageUrl:
            'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
          ),
          Product(
            name: 'مياه معدنية',
            brand: 'Aquafina',
            brandImage: 'https://www.nestlepurelife.com/lb/sites/g/files/xknfdk496/files/2018-11/33ml%20Small-Pure-Quality-Water.png.png',
            size: '1.5 لتر',
            price: 2.0,
            imageUrl:
            'https://www.nestlepurelife.com/lb/sites/g/files/xknfdk496/files/2018-11/33ml%20Small-Pure-Quality-Water.png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'عصائر',
        imageUrl:
        'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
        products: [
          Product(
            name: 'عصير برتقال',
            brand: 'Tropicana',
            brandImage: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
            size: '1 لتر',
            price: 8.5,
            imageUrl:
            'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
          ),
          Product(
            name: 'عصير تفاح',
            brand: 'Rani',
            brandImage: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
            size: '1 لتر',
            price: 7.5,
            imageUrl:
            'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
          ),
        ],
      ),
    ],
  ),
  Category(
    name: 'البسكويت والحلويات',
    imageUrl:
    'https://wallpapers.com/images/hd/cadbury-chocolate-selection-pack-8xa9go5fu7kdmziv-2.jpg',
    subcategories: [
      Subcategory(
        name: 'شوكولاتة',
        imageUrl:
        'https://corona.eg/wp-content/uploads/2023/10/dark-range-stevia.png',
        products: [
          Product(
            name: 'مارس',
            brand: 'Mars',
            brandImage:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
            size: '51 جم',
            price: 4.5,
            imageUrl:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
          ),
          Product(
            name: 'كيت كات',
            brand: 'Nestlé',
            brandImage:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
            size: '40 جم',
            price: 3.75,
            imageUrl:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
          ),
          Product(
            name: 'بيج تويك',
            brand: 'Twix',
            brandImage:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
            size: '50 جم',
            price: 4.0,
            imageUrl:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'بسكويت',
        imageUrl: 'https://elabdfoods.com/images/thumbs/0001345_-36-_550.png',
        products: [
          Product(
            name: 'أوريو',
            brand: 'Oreo',
            brandImage: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
            size: '38 جم',
            price: 2.75,
            imageUrl: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
          ),
          Product(
            name: 'مولتو',
            brand: 'Molto',
            brandImage:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
            size: '45 جم',
            price: 3.25,
            imageUrl:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
          ),
        ],
      ),
      Subcategory(
        name: 'مصاصة',
        imageUrl:
        'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
        products: [
          Product(
            name: 'هابي فروتس',
            brand: 'Happy Fruits',
            brandImage:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
            size: '4 قطع',
            price: 5.0,
            imageUrl:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
          ),
        ],
      ),
    ],
  ),
  Category(
    name: 'المشروبات',
    imageUrl:
    'https://littlecaesarsksa.com/wp-content/uploads/2018/07/92X92-04.png',
    subcategories: [
      Subcategory(
        name: 'مياه',
        imageUrl:
        'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
        products: [
          Product(
            name: 'مياه طبيعية',
            brand: 'Nestlé Pure Life',
            brandImage: 'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
            size: '1.5 لتر',
            price: 2.5,
            imageUrl:
            'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
          ),
          Product(
            name: 'مياه معدنية',
            brand: 'Aquafina',
            brandImage: 'https://www.nestlepurelife.com/lb/sites/g/files/xknfdk496/files/2018-11/33ml%20Small-Pure-Quality-Water.png.png',
            size: '1.5 لتر',
            price: 2.0,
            imageUrl:
            'https://www.nestlepurelife.com/lb/sites/g/files/xknfdk496/files/2018-11/33ml%20Small-Pure-Quality-Water.png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'عصائر',
        imageUrl:
        'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
        products: [
          Product(
            name: 'عصير برتقال',
            brand: 'Tropicana',
            brandImage: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
            size: '1 لتر',
            price: 8.5,
            imageUrl:
            'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
          ),
          Product(
            name: 'عصير تفاح',
            brand: 'Rani',
            brandImage: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
            size: '1 لتر',
            price: 7.5,
            imageUrl:
            'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
          ),
        ],
      ),
    ],
  ),
  Category(
    name: 'البسكويت والحلويات',
    imageUrl:
    'https://wallpapers.com/images/hd/cadbury-chocolate-selection-pack-8xa9go5fu7kdmziv-2.jpg',
    subcategories: [
      Subcategory(
        name: 'شوكولاتة',
        imageUrl:
        'https://corona.eg/wp-content/uploads/2023/10/dark-range-stevia.png',
        products: [
          Product(
            name: 'مارس',
            brand: 'Mars',
            brandImage:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
            size: '51 جم',
            price: 4.5,
            imageUrl:
            'https://www.pngplay.com/wp-content/uploads/15/Mars-Bar-Background-PNG-Image.webp',
          ),
          Product(
            name: 'كيت كات',
            brand: 'Nestlé',
            brandImage:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
            size: '40 جم',
            price: 3.75,
            imageUrl:
            'https://www.madewithnestle.ca/content/dam/nestlecanadaincprogram/kit-kat/en/products/kitkat_4x45g.png',
          ),
          Product(
            name: 'بيج تويك',
            brand: 'Twix',
            brandImage:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
            size: '50 جم',
            price: 4.0,
            imageUrl:
            'https://static.vecteezy.com/system/resources/previews/054/315/025/non_2x/twix-chocolate-bar-free-png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'بسكويت',
        imageUrl: 'https://elabdfoods.com/images/thumbs/0001345_-36-_550.png',
        products: [
          Product(
            name: 'أوريو',
            brand: 'Oreo',
            brandImage: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
            size: '38 جم',
            price: 2.75,
            imageUrl: 'https://pngimg.com/uploads/oreo/oreo_PNG24.png',
          ),
          Product(
            name: 'مولتو',
            brand: 'Molto',
            brandImage:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
            size: '45 جم',
            price: 3.25,
            imageUrl:
            'https://dukkanstore.net/wp-content/uploads/2024/10/%D9%83%D8%B1%D9%88%D8%A7%D8%B3%D9%88%D9%86-%D9%85%D9%88%D9%84%D8%AA%D9%88-%D8%A7%D9%84%D8%B9%D8%A8%D9%88%D8%A9-%D8%A7%D9%84%D9%83%D8%A8%D9%8A%D8%B1%D8%A9-XXL-%D8%A8%D9%88%D8%B2%D9%86-62-%D8%AC%D8%B1%D8%A7%D9%85.png',
          ),
        ],
      ),
      Subcategory(
        name: 'مصاصة',
        imageUrl:
        'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
        products: [
          Product(
            name: 'هابي فروتس',
            brand: 'Happy Fruits',
            brandImage:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
            size: '4 قطع',
            price: 5.0,
            imageUrl:
            'https://borgat.com/ar/templates/yootheme/cache/c8/TonguePaint-c8dc04e7.png',
          ),
        ],
      ),
    ],
  ),
  Category(
    name: 'المشروبات',
    imageUrl:
    'https://littlecaesarsksa.com/wp-content/uploads/2018/07/92X92-04.png',
    subcategories: [
      Subcategory(
        name: 'مياه',
        imageUrl:
        'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
        products: [
          Product(
            name: 'مياه طبيعية',
            brand: 'Nestlé Pure Life',
            brandImage: 'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
            size: '1.5 لتر',
            price: 2.5,
            imageUrl:
            'https://aquadelta.net/wp-content/uploads/2025/04/1500.webp',
          ),
          Product(
            name: 'مياه معدنية',
            brand: 'Aquafina',
            brandImage: 'https://www.nestlepurelife.com/lb/sites/g/files/xknfdk496/files/2018-11/33ml%20Small-Pure-Quality-Water.png.png',
            size: '1.5 لتر',
            price: 2.0,
            imageUrl:
            'https://www.nestlepurelife.com/lb/sites/g/files/xknfdk496/files/2018-11/33ml%20Small-Pure-Quality-Water.png.png',
          ),
        ],
      ),
      Subcategory(
        name: 'عصائر',
        imageUrl:
        'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
        products: [
          Product(
            name: 'عصير برتقال',
            brand: 'Tropicana',
            brandImage: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
            size: '1 لتر',
            price: 8.5,
            imageUrl:
            'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
          ),
          Product(
            name: 'عصير تفاح',
            brand: 'Rani',
            brandImage: 'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
            size: '1 لتر',
            price: 7.5,
            imageUrl:
            'https://mcprod.hyperone.com.eg/media/catalog/product/cache/8d4e6327d79fd11192282459179cc69e/6/2/6222014336133_2_.png',
          ),
        ],
      ),
    ],
  ),
];