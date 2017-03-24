package com.sd.data;

public class Employee {
	/*
	 * Employee Data f.Name l.Name Address.street Address.city Address.state
	 * Address.country Phone DOB Emp ID (PK) Job title Supervisor Hire Date
	 * Active/Inactive Department
	 */

	int employeeID;
	String firstName;
	String lastName;
	int address_id;
	String dob;
	String jobTitle;
	int salaryLevel;
	int storeID;
	int departmentID;
	int supervisor;
	String hireDate;
	String email;
	int status;
	
	public Employee(){
		
	}
	
	public Employee(int employeeID, String firstName, String lastName, int address_id, String dob, String jobTitle,
			int salaryLevel, int storeID, int departmentID, int supervisor, String hireDate, String email, int status) {
		super();
		this.employeeID = employeeID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address_id = address_id;
		this.dob = dob;
		this.jobTitle = jobTitle;
		this.salaryLevel = salaryLevel;
		this.storeID = storeID;
		this.departmentID = departmentID;
		this.supervisor = supervisor;
		this.hireDate = hireDate;
		this.email = email;
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "Employee [employeeID=" + employeeID + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", address_id=" + address_id + ", dob=" + dob + ", jobTitle=" + jobTitle + ", salaryLevel="
				+ salaryLevel + ", storeID=" + storeID + ", departmentID=" + departmentID + ", supervisor=" + supervisor
				+ ", hireDate=" + hireDate + ", email=" + email + ", status=" + status + "]";
	}

	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
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
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public int getSalaryLevel() {
		return salaryLevel;
	}
	public void setSalaryLevel(int salaryLevel) {
		this.salaryLevel = salaryLevel;
	}
	public int getStoreID() {
		return storeID;
	}
	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public int getDepartmentID() {
		return departmentID;
	}
	public void setDepartmentID(int departmentID) {
		this.departmentID = departmentID;
	}
	public int getSupervisor() {
		return supervisor;
	}
	public void setSupervisor(int supervisor) {
		this.supervisor = supervisor;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}

	