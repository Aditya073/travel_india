class DataFromApi {
  // Future

  // ***** make different query for {cafe, restaurant, fast-food, food_court} *******
}

// [out:json][timeout:25];

// area["name"="Maharashtra"]->.searchArea;

// (
//   node["amenity"~"cafe|fast_food|food_court"](area.searchArea);
//   way["amenity"~"cafe|fast_food|food_court"](area.searchArea);
//   relation["amenity"~"cafe|fast_food|food_court"](area.searchArea);
// );

// out body center tags;



// [out:json];

// area["name"="Maharashtra"]->.searchArea;

// (
//   node["amenity"="restaurant"](area.searchArea);
//   way["amenity"="restaurant"](area.searchArea);
//   relation["amenity"="restaurant"](area.searchArea);
// );

// out body center tags;