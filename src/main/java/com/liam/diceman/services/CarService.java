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
				return this.carRepo.findAll();
			}
			
			// Get One
			public Car getOne(Long id) {
				return this.carRepo.findById(id).orElse(null);
			}
			
			// Create
			public Car createOne(Car car) {
				return this.carRepo.save(car);
			}
			
			
			// Update
			public Car updateOne(Car car) {
				return this.carRepo.save(car);
			}
			
			// Delete
			public void deleteOne(Long id) {
				this.carRepo.deleteById(id);
			}
			
			
			
			// Many to Many
			
//			// Add liker
//			public void addRSVP(User user, Car car) {
//				// Get array list of Users from car object
//				List<User> likers = car.getRsvpers();
//				// Add User to list
//				likers.add(user);
//				// Update the Database
//				this.carRepo.save(car);
//			}
//			
//			// Remove liker
//			public void removeRSVP(User user, Car car) {
//				// Get array list of Users from car object
//				List<User> likers = car.getRsvpers();
//				// Add User to list
//				likers.remove(user);
//				// Update the Database
//				this.carRepo.save(car);
//			}

}
