window.addEventListener('load', function(e) {
	console.log('document loaded');
	init()
});

function init() {
	document.getElementById("updateFormDiv").style.display="none";
	document.parkForm.addEventListener('click', function(e) {
		e.preventDefault();
		console.log("ID Search button clicked!");
		var parkId = document.parkForm.parkId.value;
		console.log(parkId);
		if (!isNaN(parkId) && parkId > 0) {
			getPark(parkId);
		}
	});

	document.getElementById('allParks').addEventListener('click', function(e) {
		e.preventDefault();
		console.log("all parks button clicked")
		getAllParks();
	});
	document.addForm.submit.addEventListener('click', function(e) {
		e.preventDefault();
		addPark();
	});
	
	
	
}

function getPark(parkId) {
	console.log("in getpark " + parkId);
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/nationalparks/' + parkId, true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			let park = JSON.parse(xhr.response);
			console.log("***** " + park.comment);
			displayPark(park);
		} else {
			var dataDiv = document.getElementById('parkData');
			dataDiv.textContent = 'Park not found.';
		}
	};
	xhr.send();
}

function displayPark(park) {
	console.log("in displaypark " + park);
	var dataDiv = document.getElementById('parkData');
	dataDiv.textContent = '';

	let nameH2 = document.createElement('h2');
	nameH2.textContent = park.name;
	console.log(nameH2);
	dataDiv.appendChild(nameH2);

	let id = document.createElement('li');
	id.textContent = "Park ID: " + park.id;
	dataDiv.appendChild(id);

	let state = document.createElement('li');
	state.textContent = "Location: " + park.stateAbbrevLocation;
	dataDiv.appendChild(state);

	let visited = document.createElement('li');
	visited.textContent = "You Have Been Here: " + park.visited;
	dataDiv.appendChild(visited);

	let comment = document.createElement('li');
	comment.textContent = "Comment: " + park.comment;
	dataDiv.appendChild(comment);
	
	
	let editButton = document.createElement('button');
	editButton.innerHTML = "Edit Park";
	dataDiv.appendChild(editButton);
	editButton.addEventListener('click', function(e){
		e.preventDefault();
		showUpdateForm(park);
//		updatePark(park.id);
	});
	
	document.getElementById('updateFormButton').addEventListener('click', function(e){
		e.preventDefault();
		console.log("updateform button event listener added")
		let form = document.getElementById('updateForm');
		updatePark(park);
	});
	

	let delButton = document.createElement('button');
	delButton.innerHTML = "Delete Park";
	dataDiv.appendChild(delButton);
	delButton.addEventListener('click', function(e) {
		e.preventDefault();
		deletePark(park.id);
	});

}

function showUpdateForm(park){
	console.log("in showupdate form " + park)
	let updateForm = document.getElementById('updateForm');
	updateForm.parkId.value = park.id;
	updateForm.name.value = park.name;
	updateForm.stateAbbrevLocation.value = park.stateAbrevLocation;
	updateForm.visited.value = park.visited;
	updateForm.comment.value = park.comment;
	
	console.log("show update form: " + park.name)
	//updatePark(park);
	
	let updateFormDiv = document.getElementById('updateFormDiv');
//	if (updateFormDiv.style.display === "none"){
		updateFormDiv.style.display = "block";
//	}
//	else {
//		updateFormDiv.style.display = "none";
//	}
	
}

function getAllParks() {
	console.log('in get all parks')
	let xhr = new XMLHttpRequest();
	xhr.open('GET', 'api/nationalparks', true);
	xhr.onreadystatechange = function() {
		console.log('in get all parks function')
		if (xhr.readyState === 4) {
			if (xhr.status === 200 || xhr.status === 201) {
				let parks = JSON.parse(xhr.response);
				console.log("xhr.response in getall: " + xhr.response)
				displayAllParks(parks);
			}
		}
	}
	xhr.send();
}

function displayAllParks(parks) {
	console.log('in displayallparks')
	let dataDiv = document.getElementById('parkData');
	dataDiv.textContent = '';
	let table = document.createElement('table');
	dataDiv.appendChild(table);
	parks.forEach(function(park, index) {
		let tr = document.createElement('tr');
		let td = document.createElement('td');

		td.textContent = park.name;
		tr.appendChild(td);

		td = document.createElement('td');
		td.textContent = park.stateAbbrevLocation;
		tr.appendChild(td);

		table.appendChild(tr);

		tr.addEventListener('click', function(e) {
			getPark(park.id);
		});
	});
}

function addPark(e) {
	console.log("creating park!");
	var xhr = new XMLHttpRequest();
	xhr.open('POST', 'api/nationalparks');
	xhr.setRequestHeader("Content-type", "application/json");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && (xhr.status === 200 || xhr.status === 201)) {
			var park = JSON.parse(xhr.responseText);
			console.log(park);
			displayPark(park);
		}
	};

	let form = document.addForm;
	let newPark = {
		name : form.name.value,
		stateAbbrevLocation : form.stateAbbrevLocation.value,
		visited : form.visited.value,
		comment : form.comment.value
	}
	xhr.send(JSON.stringify(newPark))
}

function updatePark(park) {
	console.log("in update park fn" + park.id);
	console.log("Old name: " + park.name);
	var xhr = new XMLHttpRequest();
	xhr.open('PUT', 'api/nationalparks/' + park.id);
	xhr.setRequestHeader("Content-type", "application/json");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			var park = JSON.parse(xhr.responseText);
			displayPark(park);
		}

	};
//	var dataDiv = document.getElementById('parkData');
//	dataDiv.textContent = '';
//
//	let nameH2 = document.createElement('h2');
//	nameH2.textContent = park.name;
//	console.log(nameH2);
//	dataDiv.appendChild(nameH2);
	
	let form = document.getElementById('updateForm');
	let data = {
		name : form.name.value,
		stateAbbrevLocation : form.stateAbbrevLocation.value,
		visited : form.visited.value,
		comment : form.comment.value
	}
	console.log("Updated name: " + data.name); //printing out correct updated info! :D
	xhr.send(JSON.stringify(data));
}

function deletePark(parkId) {
	var xhr = new XMLHttpRequest();
	xhr.open('DELETE', 'api/nationalparks/' + parkId);
	xhr.setRequestHeader("Content-type", "application/json");
	xhr.onreadystatechange = function() {

		let dataDiv = document.getElementById('parkData');
		dataDiv.textContent = '';
		let delMsg = document.createElement('li');
		delMsg.textContent = "Park deleted!";
		dataDiv.appendChild(delMsg);
	};
	xhr.send();
}

function countVisitedParks() {

}
