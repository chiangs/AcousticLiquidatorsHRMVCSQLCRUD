package com.sd.data;

public class Address {

<<<<<<< HEAD
	int id;
	String address;
	String city;
	String state_province;
	int postal_code;
	String country_id;
	int phone;
	
	public Address(){
		
	}
	
	public Address(int id, String address, String state_province, int postal_code, String country_id, int phone) {
		super();
		this.id = id;
		this.address = address;
		this.city = city;
		this.state_province = state_province;
		this.postal_code = postal_code;
		this.country_id = country_id;
		this.phone = phone;

	}

	@Override
	public String toString() {
		return "Address [id=" + id + ", address=" + address + ", city=" + city + ", state_province=" + state_province
				+ ", postal_code=" + postal_code + ", country_id=" + country_id + ", phone=" + phone + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState_province() {
		return state_province;
	}

	public void setState_province(String state_province) {
		this.state_province = state_province;
	}

	public int getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(int postal_code) {
		this.postal_code = postal_code;
	}

	public String getCountry_id() {
		return country_id;
	}

	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}
	
=======
    int id;
    String address;
    String city;
    String state_province;
    int postal_code;
    String country_id;
    
    public Address(){
        
    }
    
    public Address(int id, String address, String city, String state_province, int postal_code, String country_id) {
        super();
        this.id = id;
        this.address = address;
        this.city = city;
        this.state_province = state_province;
        this.postal_code = postal_code;
        this.country_id = country_id;

    }

    @Override
    public String toString() {
        return "Address [id=" + id + ", address=" + address + ", city=" + city + ", state_province=" + state_province
                + ", postal_code=" + postal_code + ", country_id=" + country_id + "]";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState_province() {
        return state_province;
    }

    public void setState_province(String state_province) {
        this.state_province = state_province;
    }

    public int getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(int postal_code) {
        this.postal_code = postal_code;
    }

    public String getCountry_id() {
        return country_id;
    }

    public void setCountry_id(String country_id) {
        this.country_id = country_id;
    }

   
    
>>>>>>> c4e0bb70b8833ebfc5ec4c8185a0c5e2234d7721
}