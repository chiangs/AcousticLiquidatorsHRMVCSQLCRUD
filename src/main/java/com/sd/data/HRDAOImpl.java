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
		
<<<<<<< HEAD
		String sql = "Select id, first_name, last_name, address_id, date_of_birth,  "
=======
		String sql = "Select emp_id, first_name, last_name, address_id, date_of_birth, job_title, salary_level, store_id, department_id, supervisor_id, hire_date, email, active_inactive";
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
				try {
					Connection conn = DriverManager.getConnection(url, user, pass);
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, id);
					ResultSet rs = stmt.executeQuery();

					if (rs.next()) {
<<<<<<< HEAD
						emp = new Employee(rs.getInt(1); 

					}

=======
						emp = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), 
								rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
								rs.getString(12), rs.getInt(13)); 
					}
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
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

<<<<<<< HEAD
=======
<<<<<<< HEAD
		String title = newEmp.getTitle();
		

		String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating) "
				+ " VALUES (?,?,?,?,?,?,?,?,?)";
=======
		int employeeID = newEmp.getEmployeeID();
>>>>>>> cde688ed1b4146b54460fc4b0f63b77f76816bf1
		String firstName = newEmp.getFirstName();
		String lastName = newEmp.getLastName();
		int address_id = newEmp.getAddress_id();
		String dob = newEmp.getDob();
		String jobTitle = newEmp.getJobTitle();
		int salaryLevel = newEmp.getSalaryLevel();
		int storeID = newEmp.getStoreID();
		int departmentID = newEmp.getDepartmentID();
		int supervisor = newEmp.getSupervisor();
		String hireDate = newEmp.getHireDate();
		String email = newEmp.getEmail();
		int status = newEmp.getStatus();
		

		String sql = "INSERT INTO employee (first_name, last_name, address_id, date_of_birth, job_title, salary_level, store_id, department_id, supervisor_id, hire_date, email, active_inactive) "
				+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e

		String sql2 = "SELECT LAST_INSERT_ID()";

		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql); // or (sql, Statement.RETURN_GENERATED_KEYS);)

<<<<<<< HEAD
			stmt.setString(1, title);
=======
			stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setInt(3, address_id);
			stmt.setString(4, dob);
			stmt.setString(5, jobTitle);
			stmt.setInt(6, salaryLevel);
			stmt.setInt(7, storeID);
			stmt.setInt(8, departmentID);
			stmt.setInt(9, supervisor);
			stmt.setString(10, hireDate);
			stmt.setString(11, email);
			stmt.setInt(12, status);
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
			

			int uc = stmt.executeUpdate();
			if (uc > 0) {
				ResultSet rs = stmt.executeQuery(sql2); // or stmt.getGeneratedKeys();
				if (rs.next()) {
<<<<<<< HEAD
					newEmp.setId(rs.getInt(1));
=======
					newEmp.setEmployeeID(rs.getInt(1));
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
				}
			}
			stmt.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return newEmp;
	}

	@Override
	public Employee updateEmployee(Employee emp) {
<<<<<<< HEAD
		Integer id = film.getId();
        
        String sql = "UPDATE film SET title = ?,  description = ?, release_year = ?, language_id = ?, rental_duration = ?, rental_rate = ?, length = ?, replacement_cost = ?,  rating = ? WHERE id = ?";
=======
		
		String firstName = emp.getFirstName();
		String lastName = emp.getLastName();
		int address_id = emp.getAddress_id();
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
        		+ ", email = ?, active_inactive = ? WHERE id = ?";
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);

<<<<<<< HEAD
            stmt.setString(1, title);
            
            stmt.setInt(10, id);
            
=======
            stmt.setString(1, firstName);
			stmt.setString(2, lastName);
			stmt.setInt(3, address_id);
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
  
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
            int uc = stmt.executeUpdate();

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return emp;
    }

	@Override
	public String deleteEmployee(Employee emp) {
		String response = null;
<<<<<<< HEAD
        String sql = "DELETE FROM film WHERE id = ?";
=======
        String sql = "DELETE FROM employee WHERE id = ?";
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);
<<<<<<< HEAD
            stmt.setInt(1, id);
=======
            stmt.setInt(1, emp.getEmployeeID());
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
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
        String sql = "SELECT * FROM employee";
        try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

<<<<<<< HEAD
			if (rs.next()) {
				emp = new Employee(rs.getInt(1), 
=======
			while (rs.next()) {
				emp = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), 
						rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11),
						rs.getString(12), rs.getInt(13));
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
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
	public List<Employee> listEmployeesActiveOnly() {
<<<<<<< HEAD
		String sql = "SELECT * FROM employee WHERE active = 1";
		return null;
	}

}
=======
		List<Employee> empList = new ArrayList<>();
		Employee emp = null;
		String sql = "SELECT * FROM employee WHERE active = 1";
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				emp = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), 
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
}
>>>>>>> 76fa8ad025c9024e5c580dd80d2f3121bd18ae8e
