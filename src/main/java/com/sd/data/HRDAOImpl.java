package com.sd.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HRDAOImpl implements HRDAO {
	private static String url = "jdbc:mysql://localhost:3306/employeedb";
	private String user = "alhrmgr";
	private String pass = "hruser";
	
	public HRDAOImpl() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("Error loading MySQL Driver!!!");
		}
	}

	@Override
	public Employee getEmployeeById(int id) {
		Employee emp = null;
		
		String sql = "SELECT * FROM employee e JOIN address a ON e.address_id = a.id"
				+ " JOIN salary sal ON e.salary_level=sal.level"
				+ " JOIN store sto ON e.store_id = sto.id"
				+ " JOIN department dep ON dep.department_id = e.department_id WHERE e.emp_id = ?";
				try {
					Connection conn = DriverManager.getConnection(url, user, pass);
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, id);
					ResultSet rs = stmt.executeQuery();
					if (rs.next()) {
						Address a = new Address(rs.getInt(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getInt(18), rs.getString(19));
						emp = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), a, rs.getString(5), 
								rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
								rs.getString(12), rs.getInt(13)); 
						
					}
					rs.close();
					stmt.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return emp;
			}

	@Override
	public Employee addEmployee(Employee newEmp) {
		
		String firstName = newEmp.getFirstName();
		String lastName = newEmp.getLastName();
		Address address = newEmp.getAddress();
		String dob = newEmp.getDob();
		String jobTitle = newEmp.getJobTitle();
		int salaryLevel = newEmp.getSalaryLevel();
		int storeID = newEmp.getStoreID();
		int departmentID = newEmp.getDepartmentID();
		int supervisor = newEmp.getSupervisor();
		String hireDate = newEmp.getHireDate();
		String email = newEmp.getEmail();

		String sql = "INSERT INTO employee (first_name, last_name, address_id, date_of_birth, job_title, salary_level, store_id, department_id, supervisor_id, hire_date, email) "
				+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql); // or (sql, Statement.RETURN_GENERATED_KEYS);)

			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setInt(3, 1);
			stmt.setString(4, dob);
			stmt.setString(5, jobTitle);
			stmt.setInt(6, salaryLevel);
			stmt.setInt(7, 1);
			stmt.setInt(8, departmentID);
			stmt.setInt(9, supervisor);
			stmt.setString(10, hireDate);
			stmt.setString(11, email);			

			int uc = stmt.executeUpdate();
			if (uc > 0) {
				return newEmp;
			}
			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Employee updateEmployee(Employee emp) {
		

		String firstName = emp.getFirstName();
		String lastName = emp.getLastName();
		Address address = emp.getAddress();
		String dob = emp.getDob();
		String jobTitle = emp.getJobTitle();
		int salaryLevel = emp.getSalaryLevel();
		int storeID = emp.getStoreID();
		int departmentID = emp.getDepartmentID();
		int supervisor = emp.getSupervisor();
		String hireDate = emp.getHireDate();
		String email = emp.getEmail();
		int status = emp.getStatus();
		Integer id = emp.getEmployeeID();
        
        String sql = "UPDATE employee SET first_name =?, "
        		+ "last_name = ?, address_id = ?, date_of_birth = ?"
        		+ ", job_title = ?, salary_level = ?, store_id = ?"
        		+ ", department_id = ?, supervisor_id = ?, hire_date = ?"
        		+ ", email = ?, active_inactive = ? WHERE emp_id = ?";

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setInt(3, address.getId());
			stmt.setString(4, dob);
			stmt.setString(5, jobTitle);
			stmt.setInt(6, salaryLevel);
			stmt.setInt(7, storeID);
			stmt.setInt(8, departmentID);
			stmt.setInt(9, supervisor);
			stmt.setString(10, hireDate);
			stmt.setString(11, email);
			stmt.setInt(12, status);
			stmt.setInt(13, id);
  
            int uc = stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }

	@Override
	public String deleteEmployee(int id) {
		String response = null;
        String sql = "DELETE FROM employee WHERE emp_id = ?";

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            int uc = stmt.executeUpdate();
            if (uc > 0 ) {
                response = "Employee Deleted!";
            }
            else {
                response = "No Such Employee Found!";
            }
            
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response = "Unable to delete Employee!";
        }
        return response;
    }

	@Override
	public List<Employee> listEmployees() {
		List<Employee> empList = new ArrayList<>();
		Employee emp = null;
		String sql = "SELECT * FROM employee e JOIN address a ON e.address_id = a.id"
				+ " JOIN salary sal ON e.salary_level=sal.level"
				+ " JOIN store sto ON e.store_id = sto.id"
				+ " JOIN department dep ON dep.department_id = e.department_id ORDER BY e.emp_id asc";
				try {
					Connection conn = DriverManager.getConnection(url, user, pass);
					PreparedStatement stmt = conn.prepareStatement(sql);
					ResultSet rs = stmt.executeQuery();
					while (rs.next()) {
						Address a = new Address(rs.getInt(14), rs.getString(15), rs.getString(16), rs.getString(17), rs.getInt(18), rs.getString(19));
						emp = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), a, rs.getString(5), 
								rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
								rs.getString(12), rs.getInt(13)); 
						empList.add(emp);
					}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return empList;
	}

	@Override
	public Address updateAddress(Address a) {

		 	int id = a.getId();
		    String address = a.getAddress();
		    String city = a.getCity();
		    String state_province = a.getState_province();
		    int postal_code = a.getPostal_code();
		    String country_id = a.getCountry_id();
		
		
		String sql = "UPDATE address SET address =?, "
        		+ "city = ?, state_province = ?, postal_code = ?"
        		+ ", country_id = ? WHERE id = ?";

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);

            stmt.setString(1, address);
			stmt.setString(2, city);
			stmt.setString(3, state_province);
			stmt.setInt(4, postal_code);
			stmt.setString(5, country_id);
			stmt.setInt(6, id);
			
            int uc = stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
	}
}
