package com.liam.diceman.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.liam.diceman.models.Title;
import com.liam.diceman.repositories.TitleRepository;

@Service
public class TitleService {
	
	@Autowired
	private TitleRepository titleRepo;
	
	// Get All
	public List<Title> getAll() {
		return this.titleRepo.findAll();
	}
	
	// Get One
	public Title getOne(Long id) {
		return this.titleRepo.findById(id).orElse(null);
	}
	
	// Create
	public Title createOne(Title title) {
		return this.titleRepo.save(title);
	}
	
	
	// Update
	public Title updateOne(Title title) {
		return this.titleRepo.save(title);
	}
	
	// Delete
	public void deleteOne(Long id) {
		this.titleRepo.deleteById(id);
	}

}
