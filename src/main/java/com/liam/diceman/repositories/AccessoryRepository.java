package com.liam.diceman.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.liam.diceman.models.Accessory;

@Repository
public interface AccessoryRepository extends CrudRepository<Accessory, Long> {
	
	List<Accessory> findAll();

}
