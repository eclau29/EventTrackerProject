package com.skilldistillery.nationalpark.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.cfg.beanvalidation.HibernateTraversableResolver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.nationalpark.entities.NationalPark;
import com.skilldistillery.nationalpark.services.NationalParkService;

@RestController
@RequestMapping("api")
public class NationalParkController {

	/*
	 *  GET		/api/nationalparks			Retrieve all national parks
		GET		/api/nationalparks/{id}		Retrieve one national park
		POST	/api/nationalparks			Add a national park
		PUT		/api/nationalparks/{id}		Replace/Update a national park
		DELETE	/api/nationalparks/{id}		Delete a national park
	 */
	
	@Autowired
	private NationalParkService svc;
	
	@GetMapping("nationalparks")
	public List<NationalPark> showAll(){
		return svc.showAll();
	}
	
	@GetMapping("nationalparks/{id}")
	public NationalPark findParkById(@PathVariable Integer id, HttpServletRequest req, HttpServletResponse resp){
		return svc.showById(id);
	}
	
	@PostMapping("nationalparks")
	public NationalPark addPark(@RequestBody NationalPark np) {
		return svc.addPark(np);
	}
	
	@PutMapping("nationalparks/{id}")
	public NationalPark updatePark(@PathVariable Integer id, @RequestBody NationalPark np) {
		return svc.updatePark(id, np);
	}
	
	/*
	 * @DeleteMapping("posts/{id}/comments/{cid}")
	public void deleteComment (@PathVariable ("id") Integer postId, @PathVariable("cid") Integer commId,
			HttpServletResponse resp) {
		if (svc.delete(postId, commId)) {
			resp.setStatus(204);
		}
		else {
			resp.setStatus(404);
			
		}
	}
	 */
	@DeleteMapping("nationalparks/{id}")
	public void removePark(@PathVariable Integer id, HttpServletResponse resp) {
		if (svc.removePark(id)){
			resp.setStatus(204);
		}
		else {
			resp.setStatus(404);
		}
	}
}
