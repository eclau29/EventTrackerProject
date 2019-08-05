package com.skilldistillery.nationalpark.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.nationalpark.entities.NationalPark;
import com.skilldistillery.nationalpark.repositories.NationalParkRepository;

@Service
public class NationalParkServiceImpl implements NationalParkService {

	@Autowired
	private NationalParkRepository repo;

	@Override
	public List<NationalPark> showAll() {
		return repo.findAll();
	}

	@Override
	public NationalPark showById(int id) {
		Optional<NationalPark> npOpt = repo.findById(id);
		if (npOpt.isPresent()) {
			return npOpt.get();
		}
		return null;
	}

	@Override
	public NationalPark addPark(NationalPark np) {
		return repo.saveAndFlush(np);
	}

	@Override
	public NationalPark updatePark(int id, NationalPark np) {
		Optional<NationalPark> npOpt = repo.findById(id);
		NationalPark managedPark = null;
		if (npOpt.isPresent()) {
			managedPark = npOpt.get();
			
			managedPark.setName(np.getName());
			managedPark.setStateAbbrevLocation(np.getStateAbbrevLocation());
			managedPark.setVisited(np.getVisited());
			managedPark.setComment(np.getComment());
			
			repo.saveAndFlush(managedPark);
		}
		return managedPark;
	}

	@Override
	public Boolean removePark(int id) {
		Boolean deleted = false; //couldn't delete (children, maybe?)
		try {
			repo.deleteById(id);
			deleted = true;
		} catch (Exception e) {
			e.printStackTrace();
			deleted = null; //returns null when tries to delete something not there
		}
		return deleted;
	}

}
