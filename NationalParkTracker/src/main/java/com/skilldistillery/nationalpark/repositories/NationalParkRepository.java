package com.skilldistillery.nationalpark.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.nationalpark.entities.NationalPark;

public interface NationalParkRepository extends JpaRepository<NationalPark, Integer> {

}
	