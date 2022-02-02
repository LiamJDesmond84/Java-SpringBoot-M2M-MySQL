package com.liam.diceman.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liam.diceman.models.Accessory;

import com.liam.diceman.repositories.AccessoryRepository;

@Service
public class AccessoryService {
	
	@Autowired
	public AccessoryRepository accessRepo;
	
	// Get All
	public List<Accessory> getAll() {
		return accessRepo.findAll();
	}
	
	// Get One
	public Accessory getOne(Long id) {
		return accessRepo.findById(id).orElse(null);
	}
	
	// Create
	public Accessory createOne(Accessory access) {
		return accessRepo.save(access);
	}
	
	
	// Update
	public Accessory updateOne(Accessory access) {
		return accessRepo.save(access);
	}
	
	// Delete
	public void deleteOne(Long id) {
		accessRepo.deleteById(id);
	}

}
