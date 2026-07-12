class DataFromPlacesApi {}

/*
1.         ***********************************************************************************************
[out:json][timeout:120];

area["name"="Maharashtra"]["boundary"="administrative"]->.searchArea;

(
  node["natural"="beach"](area.searchArea);
  way["natural"="beach"](area.searchArea);
  relation["natural"="beach"](area.searchArea);
);

out center tags;


2.         ***********************************************************************************************
[out:json][timeout:120];

area["name"="Maharashtra"]["boundary"="administrative"]->.searchArea;

(
  node["tourism"="zoo"](area.searchArea);
  way["tourism"="zoo"](area.searchArea);
  relation["tourism"="zoo"](area.searchArea);
);

out center tags;


3.        ***********************************************************************************************
[out:json][timeout:120];

area["name"="Maharashtra"]["boundary"="administrative"]->.searchArea;

(
  node["waterway"="waterfall"](area.searchArea);
  way["waterway"="waterfall"](area.searchArea);
  relation["waterway"="waterfall"](area.searchArea);
);

out center tags;


4.         ***********************************************************************************************
  [out:json][timeout:120];

area["name"="Maharashtra"]->.searchArea;

(
  node["historic"](area.searchArea);
);

out center tags;



5.         ***********************************************************************************************
  [out:json][timeout:120];

area["name"="Maharashtra"]->.searchArea;

(
  node["leisure"](area.searchArea);    ---> parks
);

out center tags;



6.         ***********************************************************************************************
[out:json][timeout:120];

area["name"="Maharashtra"]["boundary"="administrative"]->.searchArea;

(
  node["tourism"="museum"](area.searchArea);
  way["tourism"="museum"](area.searchArea);
  relation["tourism"="museum"](area.searchArea);
);

out center tags;
*/
