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
import model.Category;
import model.Product;

/**
 *
 * @author vuv90
 */
public class ProductDAO extends DAO {

    //insert 
    public void insert(Product c) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([id]\n"
                + "           ,[name]\n"
                + "           ,[quantity]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[createdate]\n"
                + "           ,[categoryID])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setInt(3, c.getQuantity());
            st.setDouble(4, c.getPrice());
            st.setString(5, c.getDescription());
            st.setString(6, c.getImg());
            st.setString(7, c.getCreatedate());
            st.setInt(8, c.getCategoryID());

            st.executeUpdate();
        } catch (SQLException sqle) {
            System.out.println(sqle);
        }
    }

    public List<Product> getProductByPrice(int start, int end) {
        List<Product> fs = new ArrayList<>();
        String spl = "select * from Product where price >? and price < ?";

        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, start);
            st.setInt(2, end);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                fs.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;
    }

    public static void main(String[] args) {
        ProductDAO pdao = new ProductDAO();
        System.out.println(pdao.getTotalProductBySerachPrice(0, 500));
    }

    public int getMaxProductID() {
        String sql = "select max(id) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProduct() {
        String sql = "select COUNT(*) from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProductBysearch(String search) {
        String sql = "select COUNT(*) from product\n"
                + "where name like '%" + search + "%'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalQuantity() {
        String sql = "select sum(quantity) from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int getTotalProductByID(int cid) {
        String sql = "select count(*) from Product where categoryid=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public void delete(int pid) {
        String sql = "delete from Product where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //update name ,quantity,price
    public void update(int id, String name, String img, int quantity, double price, int categoryId) {
        String sql = "UPDATE Product\n"
                + "SET [name] = ?,quantity=?,image=?,price=?,categoryID=?\n"
                + "WHERE id=?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(2, quantity);
            st.setString(1, name);
            st.setString(3, img);
            st.setDouble(4, price);

            st.setInt(6, id);
            st.setInt(5, categoryId);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateAfterCheckOut(int quantity, int pid) {
        String sql = "update Product\n"
                + "set quantity = quantity -?\n"
                + "where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quantity);
            st.setInt(2, pid);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    //pagination
    public List<Product> pagingProduct(int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "order by id\n"
                + "offset ? rows fetch next 12 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> pageProductByPrice(int index, int start, int end) {
        List<Product> fs = new ArrayList<>();
        String spl = "select * from Product where price >? and price < ?\n"
                + "order by id\n"
                + "offset ? rows fetch next 9 rows only";

        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, start);
            st.setInt(2, end);
            st.setInt(3, (index - 1) * 9);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                fs.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;
    }

    public int getTotalProductBySerachPrice(int min, int max) {
        String sql = "select count(*) from Product where price >=? and price <= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, min);
            st.setInt(2, max);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    //pagination search
    public List<Product> pagingProductBySearch(String search, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where name like '%" + search + "%'\n"
                + "order by id\n"
                + "offset ? rows fetch next 9 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, (index - 1) * 9);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> productBySearchInManage(String search, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where name like '%" + search + "%'";
               if(index > 0){ 
                sql+=" and categoryID = ?";
               }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if(index>0){
            st.setInt(1, index);
            }
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //pagination categorys
    public List<Product> pagingProductbyCategoryID(int categoryID, int index) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where categoryID=?\n"
                + "                 order by id\n"
                + "                 offset ? rows fetch next 9 rows only";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryID);
            st.setInt(2, (index - 1) * 9);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getAllproduct() {

        List<Product> fs = new ArrayList<>();
        String spl = "select * from Product\n"
                + "\n"
                + " ";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                fs.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;

    }

    public List<Product> getProductByID(int id) {
        List<Product> fs = new ArrayList<>();
        String spl = "select * from Product where categoryID=?";

        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Product p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                fs.add(p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return fs;
    }

    public Product getAProductByID(int id) {
        Product p = new Product();
        String spl = "select * from product where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                p = new Product(rs.getInt("id"), rs.getString("name"),
                        rs.getInt("quantity"), rs.getDouble("price"), rs.getString("description"),
                        rs.getString("image"), rs.getString("createdate"), rs.getInt("categoryID"));
                return p;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
