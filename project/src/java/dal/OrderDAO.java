/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import model.Order;

/**
 *
 * @author vuv90
 */
public class OrderDAO extends DBContext{

    public int createReturnId(Order order) {
        String spl = "INSERT INTO [dbo].[Order]\n"
                + "           ([account_id]\n"
                + "           ,[totalPrice]\n"
                + "           ,[note]\n"
                + "           ,[shippingid])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement st = connection.prepareStatement(spl, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, order.getAccountID());
            st.setDouble(2, order.getTotalPrice());
            st.setString(3, order.getNote());
             st.setInt(4, order.getShippingID());
            st.executeUpdate();

            ResultSet rs = st.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }
    public static void main(String[] args) {
        OrderDAO odao =new OrderDAO();
         Order order = new Order(1,55.7, "hello", 30);
         System.out.println(odao.createReturnId(order));
    }

}
