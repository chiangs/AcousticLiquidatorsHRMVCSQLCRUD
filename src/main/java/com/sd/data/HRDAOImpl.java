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
		
		String sql = "Select emp_id, first_name, last_name, address_id, date_of_birth, job_title, salary_level, store_id, department_id, supervisor_id, hire_date, email, active_inactive FROM employee WHERE emp_id = ?";
				try {
					Connection conn = DriverManager.getConnection(url, user, pass);
					PreparedStatement stmt = conn.prepareStatement(sql);
					stmt.setInt(1, id);
					ResultSet rs = stmt.executeQuery();

					if (rs.next()) {
						emp = new Employee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), 
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
		int address_id = newEmp.getAddress_id();
		String dob = newEmp.getDob();
		String jobTitle = newEmp.getJobTitle();
		int salaryLevel = newEmp.getSalaryLevel();
		int storeID = newEmp.getStoreID();
		int departmentID = newEmp.getDepartmentID();
		int supervisor = newEmp.getSupervisor();
		String hireDate = newEmp.getHireDate();
		String email = newEmp.getEmail();

		String sql = "INSERT INTO employee (first_name, last_name, address_id, date_of_birth, job_title, salary_level, store_id, department_id, supervisor_id, hire_date, email, active_inactive) "
				+ " VALUES (?,?,?,?,?,?,?,?,?,?,?)";

//		String sql2 = "SELECT LAST_INSERT_ID()";

		
		
		try {
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql); // or (sql, Statement.RETURN_GENERATED_KEYS);)

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

			int uc = stmt.executeUpdate();
			if (uc > 0) {
				return newEmp;
//				ResultSet rs = stmt.executeQuery(sql2); // or stmt.getGeneratedKeys();
//				if (rs.next()) {
//					newEmp.setEmployeeID(rs.getInt(1));
//				}
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

        try {
            Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement stmt = conn.prepareStatement(sql);

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
        String sql = "SELECT * FROM employee";
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
	
	@Override
	public List<Employee> listEmployeesActiveOnly() {
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
