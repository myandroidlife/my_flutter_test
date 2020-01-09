class SearchItemEntity {
	String queryCode;
	int total;
	List<SearchItemData> data;
	String resultPageUrl;
	bool isLastPage;
	List<Null> resultTypes;
	String queryRule;
	List<String> highLights;

	SearchItemEntity({ this.queryCode, this.total, this.data, this.resultPageUrl, this.isLastPage, this.resultTypes, this.queryRule, this.highLights});

	SearchItemEntity.fromJson(Map<String, dynamic> json) {
		queryCode = json['queryCode'];
		total = json['total'];
		if (json['data'] != null) {
			data = new List<SearchItemData>();(json['data'] as List).forEach((v) { data.add(new SearchItemData.fromJson(v)); });
		}
		resultPageUrl = json['resultPageUrl'];
		isLastPage = json['isLastPage'];
		if (json['resultTypes'] != null) {
			resultTypes = new List<Null>();
		}
		queryRule = json['queryRule'];
		highLights = json['highLights']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();

		data['queryCode'] = this.queryCode;
		data['total'] = this.total;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['resultPageUrl'] = this.resultPageUrl;
		data['isLastPage'] = this.isLastPage;
		if (this.resultTypes != null) {
      data['resultTypes'] =  [];
    }
		data['queryRule'] = this.queryRule;
		data['highLights'] = this.highLights;
		return data;
	}
}

class SearchItemHead {




	SearchItemHead.fromJson(Map<String, dynamic> json) {
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}

class SearchItemData {
	String code;
	String distance;
	String priceTag;
	double commentScore;
	double lon;
	int cityId;
	String type;
	int sales;
	String tagNames;
	String price;
	String imageUrl;
	int simNum;
	String alias;
	String commentlevel;
	int startScore;
	int id;
	double childProductScore;
	String scoreDesc;
	int traveldays;
	List<SearchItemDataChildproductlist> childProductList;
	double lat;
	String childScoreDesc;
	String address;
	String locationName;
	String eName;
	String districtName;
	SearchItemDataMore more;
	int productScore;
	String vendorName;
	String url;
	int commentCount;
	String commentlabel;
	double luceneScore;
	int districtId;
	String comment;
	String word;
	int parentDistrictId;

	SearchItemData({this.code, this.distance, this.priceTag, this.commentScore, this.lon, this.cityId, this.type, this.sales, this.tagNames, this.price, this.imageUrl, this.simNum, this.alias, this.commentlevel, this.startScore, this.id, this.childProductScore, this.scoreDesc, this.traveldays, this.childProductList, this.lat, this.childScoreDesc, this.address, this.locationName, this.eName, this.districtName, this.more, this.productScore, this.vendorName, this.url, this.commentCount, this.commentlabel, this.luceneScore, this.districtId, this.comment, this.word, this.parentDistrictId});

	SearchItemData.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		distance = json['distance'];
		priceTag = json['priceTag'];
		commentScore = json['commentScore'];
		lon = json['lon'];
		cityId = json['cityId'];
		type = json['type'];
		sales = json['sales'];
		tagNames = json['tagNames'];
		price = json['price'];
		imageUrl = json['imageUrl'];
		simNum = json['simNum'];
		alias = json['alias'];
		commentlevel = json['commentlevel'];
		startScore = json['startScore'];
		id = json['id'];
		childProductScore = json['childProductScore'];
		scoreDesc = json['scoreDesc'];
		traveldays = json['traveldays'];
		if (json['childProductList'] != null) {
			childProductList = new List<SearchItemDataChildproductlist>();(json['childProductList'] as List).forEach((v) { childProductList.add(new SearchItemDataChildproductlist.fromJson(v)); });
		}
		lat = json['lat'];
		childScoreDesc = json['childScoreDesc'];
		address = json['address'];
		locationName = json['locationName'];
		eName = json['eName'];
		districtName = json['districtName'];
		more = json['more'] != null ? new SearchItemDataMore.fromJson(json['more']) : null;
		productScore = json['productScore'];
		vendorName = json['vendorName'];
		url = json['url'];
		commentCount = json['commentCount'];
		commentlabel = json['commentlabel'];
		luceneScore = json['luceneScore'];
		districtId = json['districtId'];
		comment = json['comment'];
		word = json['word'];
		parentDistrictId = json['parentDistrictId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['distance'] = this.distance;
		data['priceTag'] = this.priceTag;
		data['commentScore'] = this.commentScore;
		data['lon'] = this.lon;
		data['cityId'] = this.cityId;
		data['type'] = this.type;
		data['sales'] = this.sales;
		data['tagNames'] = this.tagNames;
		data['price'] = this.price;
		data['imageUrl'] = this.imageUrl;
		data['simNum'] = this.simNum;
		data['alias'] = this.alias;
		data['commentlevel'] = this.commentlevel;
		data['startScore'] = this.startScore;
		data['id'] = this.id;
		data['childProductScore'] = this.childProductScore;
		data['scoreDesc'] = this.scoreDesc;
		data['traveldays'] = this.traveldays;
		if (this.childProductList != null) {
      data['childProductList'] =  this.childProductList.map((v) => v.toJson()).toList();
    }
		data['lat'] = this.lat;
		data['childScoreDesc'] = this.childScoreDesc;
		data['address'] = this.address;
		data['locationName'] = this.locationName;
		data['eName'] = this.eName;
		data['districtName'] = this.districtName;
		if (this.more != null) {
      data['more'] = this.more.toJson();
    }
		data['productScore'] = this.productScore;
		data['vendorName'] = this.vendorName;
		data['url'] = this.url;
		data['commentCount'] = this.commentCount;
		data['commentlabel'] = this.commentlabel;
		data['luceneScore'] = this.luceneScore;
		data['districtId'] = this.districtId;
		data['comment'] = this.comment;
		data['word'] = this.word;
		data['parentDistrictId'] = this.parentDistrictId;
		return data;
	}
}

class SearchItemDataChildproductlist {
	String code;
	double commentScore;
	double lon;
	int cityId;
	String type;
	int sales;
	String tagNames;
	String price;
	String imageUrl;
	int simNum;
	int startScore;
	int id;
	double childProductScore;
	String scoreDesc;
	int traveldays;
	double lat;
	String childScoreDesc;
	int productScore;
	String url;
	int commentCount;
	double luceneScore;
	int districtId;
	String advanceBookingDays;
	String word;
	int parentDistrictId;

	SearchItemDataChildproductlist({this.code, this.commentScore, this.lon, this.cityId, this.type, this.sales, this.tagNames, this.price, this.imageUrl, this.simNum, this.startScore, this.id, this.childProductScore, this.scoreDesc, this.traveldays, this.lat, this.childScoreDesc, this.productScore, this.url, this.commentCount, this.luceneScore, this.districtId, this.advanceBookingDays, this.word, this.parentDistrictId});

	SearchItemDataChildproductlist.fromJson(Map<String, dynamic> json) {
		code = json['code'];
		commentScore = json['commentScore'];
		lon = json['lon'];
		cityId = json['cityId'];
		type = json['type'];
		sales = json['sales'];
		tagNames = json['tagNames'];
		price = json['price'];
		imageUrl = json['imageUrl'];
		simNum = json['simNum'];
		startScore = json['startScore'];
		id = json['id'];
		childProductScore = json['childProductScore'];
		scoreDesc = json['scoreDesc'];
		traveldays = json['traveldays'];
		lat = json['lat'];
		childScoreDesc = json['childScoreDesc'];
		productScore = json['productScore'];
		url = json['url'];
		commentCount = json['commentCount'];
		luceneScore = json['luceneScore'];
		districtId = json['districtId'];
		advanceBookingDays = json['advanceBookingDays'];
		word = json['word'];
		parentDistrictId = json['parentDistrictId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['code'] = this.code;
		data['commentScore'] = this.commentScore;
		data['lon'] = this.lon;
		data['cityId'] = this.cityId;
		data['type'] = this.type;
		data['sales'] = this.sales;
		data['tagNames'] = this.tagNames;
		data['price'] = this.price;
		data['imageUrl'] = this.imageUrl;
		data['simNum'] = this.simNum;
		data['startScore'] = this.startScore;
		data['id'] = this.id;
		data['childProductScore'] = this.childProductScore;
		data['scoreDesc'] = this.scoreDesc;
		data['traveldays'] = this.traveldays;
		data['lat'] = this.lat;
		data['childScoreDesc'] = this.childScoreDesc;
		data['productScore'] = this.productScore;
		data['url'] = this.url;
		data['commentCount'] = this.commentCount;
		data['luceneScore'] = this.luceneScore;
		data['districtId'] = this.districtId;
		data['advanceBookingDays'] = this.advanceBookingDays;
		data['word'] = this.word;
		data['parentDistrictId'] = this.parentDistrictId;
		return data;
	}
}

class SearchItemDataMore {
	bool xShow;

	SearchItemDataMore({this.xShow});

	SearchItemDataMore.fromJson(Map<String, dynamic> json) {
		xShow = json['show'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['show'] = this.xShow;
		return data;
	}
}
