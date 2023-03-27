/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import org.eclipse.jdt.core.compiler.CategorizedProblem;

/**
 *
 * @author vuv90
 */
public class DAO extends DBContext {

    public List<Category> getAll() {
        List<Category> fs = new ArrayList<>();
        String spl = "select * from Category\n"
                + "\n"
                + " ";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                fs.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();

        System.out.println(dao.getCategoryByID(1));
    }
    public Category getCategoryByID(int id) {
        String sql = "SELECT [ID]\n"
                + "      ,[name]\n"
                + "  FROM [Category] \n"
                + "  where [ID]=?;";
        try {

            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category(rs.getInt(1), rs.getString(2));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
//
//    public ArrayList<products> getProductsbyID(int cid) {
//        ArrayList<products> list = new ArrayList<>();
//        String sql = "select * from products where 1=1 ";
//        if (cid != 0) {
//            sql += " and cid=" + cid;
//        }
//        try {
//            PreparedStatement statement = connection.prepareStatement(sql);
////             statement.setInt(1, cid); co cong cid nen k can neu k co thi them vao
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                products p = new products();
//                p.setID(rs.getString("id"));
//                p.setName(rs.getString("name"));
//                p.setPrice(rs.getInt("price"));
//                p.setReleaseDate(rs.getString("releaseDate"));
//                p.setDescribe(rs.getString("describe"));
//                p.setImage(rs.getString("image"));
//                Category c = getCategoryByID(rs.getInt("cid"));
//                p.setCategory(c);
//                list.add(p);
//            }
//        } catch (SQLException exception) {
//
//        }
//        return list;
//    }
//
//   public products getProductDetailByID(String id) {
//    String sql = "SELECT p.[ID], p.[name], p.[quantity], p.[price], p.[releaseDate], p.[describe], p.[image], p.[cid] " +
//            "FROM [dbo].[products] p WHERE p.[ID] = ?";
//    try {
//        PreparedStatement st = connection.prepareStatement(sql);
//        st.setString(1, id);
//        ResultSet rs = st.executeQuery();
//        while (rs.next()) {
//            products p = new products(rs.getString("ID"), rs.getString("name"), rs.getInt("quantity"), rs.getDouble("price"),
//                    rs.getString("releaseDate"), rs.getString("describe"), rs.getString("image"), getCategoryByID(rs.getInt("cid")));
//            return p;
//        }
//    } catch (SQLException e) {
//        System.out.println(e);
//    }
//    return null;
//}
//
//   public ArrayList<products> search(String key,Date from,Date to,Double price1,
//           Double price2,int cid){
//       ArrayList<products> list=new ArrayList<>();
//       String sql="select * from products where 1=1";
//       if(key!=null && !key.equals("")){
//           sql+=" and name like '%"+key+"%' or describe like '%"+key+"%'";
//       }
//        if(from!=null){
//            sql+=" and releaseDate>='"+from+"'";
//        }
//          if(to!=null){
//            sql+=" and releaseDate<='"+to+"'";
//        }
//           if(price1!=null){
//            sql+=" and price>="+price1;
//        }
//             if(price2!=null){
//            sql+=" and price<="+price2;
//        }
//            if(cid!=0){
//                sql+=" and cid="+cid;
//            }
//            try{
//                 PreparedStatement statement = connection.prepareStatement(sql);
////             statement.setInt(1, cid); co cong cid nen k can neu k co thi them vao
//            ResultSet rs = statement.executeQuery();
//            while (rs.next()) {
//                products p = new products();
//                p.setID(rs.getString("id"));
//                p.setName(rs.getString("name"));
//                p.setPrice(rs.getInt("price"));
//                p.setReleaseDate(rs.getString("releaseDate"));
//                p.setDescribe(rs.getString("describe"));
//                p.setImage(rs.getString("image"));
//                Category c = getCategoryByID(rs.getInt("cid"));
//                p.setCategory(c);
//                list.add(p);
//            }
//        } catch (SQLException exception) {
//
//        }
//            
//           return list;
//   }

}
