/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Category;

/**
 *
 * @author vuv90
 */
public class AccountDAO extends DBContext {

    public Account login(String username, String password) {

        String spl = "SELECT *\n"
                + "  FROM [dbo].[Account]\n"
                + "  where username=? and [password]=?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account a = new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getUsername(String s) {
        String spl = "select username from Account where username like ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, s);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getAccountForgot(String s) {
        String spl = "select count(*) from Account where email like ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, s);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void updateAfterForgot(String pass, String email) {
        String sql = "update Account\n"
                + "set password = ? \n"
                + "where email like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);

        } catch (SQLException e) {
        }
    }

    //insert 
    public void insertAccount(Account c) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[displayName]\n"
                + "           ,[address]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUsername());
            st.setString(2, c.getPassword());
            st.setString(3, c.getDisplayName());
            st.setString(4, c.getAddress());
            st.setString(5, c.getEmail());
            st.setString(6, c.getPhone());
            st.setString(7, c.getRole());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.out.println(sqle);
        }
    }

    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        System.out.println(adao.getUsername("vuv909"));
    }
}
