package com.liam.diceman.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liam.diceman.models.Car;
import com.liam.diceman.models.User;
import com.liam.diceman.repositories.CarRepository;

@Service
public class CarService {
	
	@Autowired
	private CarRepository carRepo;
	
	// Get All
			public List<Car> getAll() {
				return carRepo.findAll();
			}
			
			// Get One
			public Car getOne(Long id) {
				return carRepo.findById(id).orElse(null);
			}
			
			// Create
			public Car createOne(Car car) {
				return carRepo.save(car);
			}
			
			
			// Update
			public Car updateOne(Car car) {
				return carRepo.save(car);
			}
			
			// Delete
			public void deleteOne(Long id) {
				carRepo.deleteById(id);
			}
			
			
			
			// Many to Many
			
//			// Add -thing-
//			public void addExtra(User user, Car car) {
//				// Get array list of Users from car object
//				List<User> adders = car.getRatings();
//				// Add User to list
//				likers.add(adders);
//				// Update the Database
//				this.carRepo.save(car);
//			}
//			
//			// Remove -thing-
//			public void removeExtra(User user, Car car) {
//				// Get array list of Users from car object
//				List<User> adders = car.getRatings();
//				// Add User to list
//				likers.remove(adders);
//				// Update the Database
//				this.carRepo.save(car);
//			}

}
