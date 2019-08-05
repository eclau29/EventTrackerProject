package com.skilldistillery.nationalpark.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "national_park")
public class NationalPark {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name="state_abbrev_location")
	private String stateAbbrevLocation;
	
	private Boolean visited;
	private String comment;
	
	
	// M E T H O D S
	
	public int getId() {
		return id;
	}
	public Boolean getVisited() {
		return visited;
	}
	public void setVisited(Boolean visited) {
		this.visited = visited;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStateAbbrevLocation() {
		return stateAbbrevLocation;
	}
	public void setStateAbbrevLocation(String stateAbbrevLocation) {
		this.stateAbbrevLocation = stateAbbrevLocation;
	}
	public Boolean isVisited() {
		return visited;
	}
	public void setVisited(boolean visited) {
		this.visited = visited;
	}
	public NationalPark() {
		super();
	}
	public NationalPark(int id, String name, String stateAbbrevLocation, boolean visited) {
		super();
		this.id = id;
		this.name = name;
		this.stateAbbrevLocation = stateAbbrevLocation;
		this.visited = visited;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NationalPark other = (NationalPark) obj;
		if (id != other.id)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "NationalPark [id=" + id + ", name=" + name + ", stateAbbrevLocation=" + stateAbbrevLocation
				+ ", visited=" + visited + ", comment=" + comment + "]";
	}
	
	

}
