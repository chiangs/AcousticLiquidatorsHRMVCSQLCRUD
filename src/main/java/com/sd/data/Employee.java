package com.sd.data;

public class Employee {
	/*
	 * Employee Data f.Name l.Name Address.street Address.city Address.state
	 * Address.country Phone DOB Emp ID (PK) Job title Supervisor Hire Date
	 * Active/Inactive Department
	 */

	String firstName;
	String lastName;
	String street;
	String city;
	String country;
	int phone;
	String dob;
	int empId;
	String jobTitle;
	String supervisor;
	String hireDate;
	String status;
	String department;

	public Employee(String firstName, String lastName, String street, String city, String country, int phone,
			String dob, int empId, String jobTitle, String supervisor, String hireDate, String status,
			String department) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.street = street;
		this.city = city;
		this.country = country;
		this.phone = phone;
		this.dob = dob;
		this.empId = empId;
		this.jobTitle = jobTitle;
		this.supervisor = supervisor;
		this.hireDate = hireDate;
		this.status = status;
		this.department = department;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getSupervisor() {
		return supervisor;
	}

	public void setSupervisor(String supervisor) {
		this.supervisor = supervisor;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "Employee [firstName=" + firstName + ", lastName=" + lastName + ", street=" + street + ", city=" + city
				+ ", country=" + country + ", phone=" + phone + ", dob=" + dob + ", empId=" + empId + ", jobTitle="
				+ jobTitle + ", supervisor=" + supervisor + ", hireDate=" + hireDate + ", status=" + status
				+ ", department=" + department + "]";
	}

}
