package com.skilldistillery.nationalpark.services;

import java.util.List;

import com.skilldistillery.nationalpark.entities.NationalPark;

public interface NationalParkService {
	/*
	 *  GET		/api/nationalparks			Retrieve all national parks
		GET		/api/nationalparks/{id}		Retrieve one national park
		POST	/api/nationalparks			Add a national park
		PUT		/api/nationalparks/{id}		Replace/Update a national park
		DELETE	/api/nationalparks/{id}		Delete a national park
	 */
	List<NationalPark> showAll();
	NationalPark showById(int id);
	NationalPark addPark(NationalPark np);
	NationalPark updatePark(int id, NationalPark np);
	Boolean removePark(int id);
	
}
