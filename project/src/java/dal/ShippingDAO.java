/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Product;
import model.Shipping;

/**
 *
 * @author vuv90
 */
public class ShippingDAO extends DBContext {

    public int createReturnId(Shipping shipping) {

        String spl = "INSERT INTO [dbo].[Shipping]\n"
                + "           ([name]\n"
                + "           ,[address]\n"
                + "           ,[phone])\n"
             
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(spl, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, shipping.getName());
            st.setString(2, shipping.getAddress());
            st.setString(3, shipping.getPhone());

            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if(rs.next()){
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

}
