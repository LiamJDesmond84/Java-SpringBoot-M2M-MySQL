package com.liam.diceman.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="cars")
public class Car {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message="Make is required!")
	@Size(min=3, max=30)
	private String make;
	
	@NotBlank(message="Model is required!")
	@Size(min=3, max=30)
	private String model;
	
	@NotBlank(message="Color is required!")
	@Size(min=3, max=30)
	private String color;
	
	@NotNull
	@Min(00)
	private int year;
	
	@NotBlank(message="Transmission is required!")
	@Size(min=3, max=30)
	private String transmission;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern = "yyy-MM-DD HH:mm:ss")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "yyy-MM-DD HH:mm:ss")
	private Date updatedAt;
	
	
	
	
	// One to One
	@OneToOne(mappedBy="car",cascade = CascadeType.ALL, fetch=FetchType.LAZY)
	private Title title;
	
	// Many to One
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User owner;
	
	
	
	// One to Many
	@OneToMany(mappedBy="mainOwner", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	private List<Accessory> accessories;
	
	
	
	// Many to Many
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(
			name="likes",
			joinColumns = @JoinColumn(name="car_id"),
			inverseJoinColumns = @JoinColumn(name="user_id"))
	private List<User> likers;
	
	
	
	// Many to Many with Fields in between
	@OneToMany(mappedBy = "mainRating", fetch = FetchType.LAZY)
	private List<Rating> ratings;
	
	
	public Car() {
	}
	

	
	
	
	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getMake() {
		return make;
	}


	public void setMake(String make) {
		this.make = make;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public String getTransmission() {
		return transmission;
	}


	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}


	public Date getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


	public User getOwner() {
		return owner;
	}


	public void setOwner(User owner) {
		this.owner = owner;
	}





	public Title getTitle() {
		return title;
	}





	public void setTitle(Title title) {
		this.title = title;
	}





	public List<Accessory> getAccessories() {
		return accessories;
	}





	public void setAccessories(List<Accessory> accessories) {
		this.accessories = accessories;
	}





	public List<User> getLikers() {
		return likers;
	}





	public void setLikers(List<User> likers) {
		this.likers = likers;
	}





	public List<Rating> getRatings() {
		return ratings;
	}





	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}
	
	
	
	

}
