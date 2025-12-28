package com.sms.dao;

import com.sms.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	public UserDAO() {
	    System.out.println("UserDAO LOADED");
	}


    public boolean validate(String username, String password) {
        String sql = "SELECT password FROM users WHERE username = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String dbpass = rs.getString("password");
                    System.out.println("DB PASS = [" + dbpass + "]");
                    System.out.println("ENTERED PASS = [" + password + "]");
                    return dbpass.trim().equals(password.trim());
                } else {
                    System.out.println("USERNAME NOT FOUND");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
