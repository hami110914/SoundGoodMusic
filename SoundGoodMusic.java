import java.sql.*;
import java.util.Scanner;


class Driver {

    public static void main(String[] args) {

        try {
            Connection myconn = DriverManager.getConnection("jdbc:mysql://localhost:3306/SoundGoodMusic", "root", "Hami110914");
            Statement myStmt = myconn.createStatement();
            Statement myStmt2 = myconn.createStatement();
            Statement myStmt3 = myconn.createStatement();

            Scanner in = new Scanner(System.in);
            System.out.println("Choose one option: -list , -rent, -cancel, -finish, -help ");
            String name = in.next();

            while(name!="END") {
                switch(name){
                    case "list":
                        listInstrument(myStmt);
                        break;
                    case "rent":
                        rentInstrument(myStmt, myStmt2, myStmt3, in);
                        break;
                    case "cancel":
                        terminateRental(myStmt, myStmt2, in);
                        break;
                    case "help":
                        System.out.println("Choose one option: -list , -rent, -cancel, -finish, -help ");
                        break;
                    case "finish":
                        System.out.println("GoodBye");
                        return;
                    default:
                        System.out.println("There is no such a choice in the list");
                }
                System.out.println();
                name = in.next();
            }
            in.close();
            myconn.close();
            myStmt.close();
            myStmt2.close();
            myStmt3.close();
        }
        catch(Exception exc) {exc.printStackTrace();}

    }

    public static void listInstrument (Statement myStmt) throws SQLException {

        String Query = "select * from instrument where quantity > 0";
        ResultSet myRs = myStmt.executeQuery(Query);

        while(myRs.next()) {
            System.out.println("instrument_id: " + myRs.getString("instrument_id")
                    + "	| " + "name: " + myRs.getString("name")
                    + " | " + "price: " +myRs.getString("price")
                    + " | " + "brand: " +myRs.getString("brand")
                    +  " | " + "quantity: " +myRs.getString("quantity")) ;
            System.out.println();
        }

    }

    public static void rentInstrument(Statement myStmt, Statement myStmt2, Statement myStmt3, Scanner in) throws SQLException {
        System.out.println("Enter Student ID: ");
        System.out.println();
        String student_id = in.next();
        System.out.println();
        System.out.println("Enter brand of instrument: ");
        System.out.println();
        String brand = in.next();

        String query1 = "SELECT quantity FROM instrument WHERE brand = '" + brand + "'";
        ResultSet stock = myStmt.executeQuery(query1);

        String query2 = "SELECT count(rental_id) as rentals FROM student_instrument "
                        +"WHERE student_id = " + student_id + " AND student_instrument.cancellation IS NULL";
        ResultSet max = myStmt2.executeQuery(query2);

        String query3 = "SELECT firstname, lastname FROM person INNER JOIN student ON person.person_id = student.person_id WHERE student_id = " + student_id;
        ResultSet name = myStmt3.executeQuery(query3);

        if(stock.next()) {

            if (stock.getString("quantity").equals("0")) {
                System.out.println();
                System.out.println(brand + " is out of stock");
            }

            else if (max.next()) {
                if (max.getString("rentals").equals("2")) {
                    System.out.println();
                    System.out.println("Number of rental exceeded");

                } else {

                    String rent = "INSERT INTO student_instrument (instrument_id, rental_id, student_id, rental_date) " +
                            "SELECT (SELECT instrument_id FROM instrument WHERE brand = '" + brand + "'), MAX(rental_id)+1," + student_id + ", + NOW()  " +
                            "FROM student_instrument";
                    myStmt.executeUpdate(rent);

                    String query4 = "UPDATE instrument "
                            + "INNER JOIN student_instrument "
                            + "ON instrument.instrument_id = student_instrument.instrument_id "
                            + "SET quantity = quantity-1 WHERE brand LIKE '" + brand + "%'";
                    myStmt.executeUpdate(query4);


                    String query5 = "SELECT name FROM instrument WHERE brand = '" + brand + "'";
                    ResultSet instrument = myStmt.executeQuery(query5);

                    System.out.println();
                    while (instrument.next()) {
                        while (name.next()) {
                            System.out.println("Instrument " + brand + " (" + instrument.getString("name") + ") " + "is now rented by student: " + student_id +
                                    " (" + name.getString("firstname") + " " + name.getString("lastname") + ")");
                            System.out.println("Your instrument has been successfully rented.");
                        }
                    }
                }

            }
        }
    }

    public static void terminateRental(Statement myStmt, Statement myStmt2, Scanner in) throws SQLException {
        System.out.println();
        System.out.println("Enter Student ID: ");
        System.out.println();
        String student_id = in.next();
        System.out.println();
        System.out.println("Enter brand of instrument: ");
        System.out.println();
        String cancellation = in.next();

        String query1 = "SELECT firstname, lastname FROM person INNER JOIN student ON person.person_id = student.person_id  WHERE student_id = " + student_id;
        ResultSet name = myStmt2.executeQuery(query1);

        String query2 = "UPDATE student_instrument " +
                        "SET cancellation = "  + "NOW()" +
                        "WHERE student_id = " + student_id + " " +
                        "AND instrument_id = (SELECT instrument_id FROM instrument WHERE brand = '" + cancellation + "')";
        myStmt.executeUpdate(query2);

        String query3 = "UPDATE instrument "
                        + "INNER JOIN student_instrument "
                        + "ON instrument.instrument_id = student_instrument.instrument_id "
                        + "SET quantity = quantity+1 WHERE brand LIKE '"+cancellation+"%'";
        myStmt.executeUpdate(query3);

        String query4 = "SELECT name FROM instrument WHERE brand = '"+cancellation+"'";
        ResultSet instrument = myStmt.executeQuery(query4);

        System.out.println();
        while(instrument.next()) {
            while (name.next()) {
                System.out.println("Instrument " + cancellation + " (" + instrument.getString("name") + ") "
                        + "is returned by student: " + student_id +
                        " (" + name.getString("firstname") + " " + name.getString("lastname") + ")");
                System.out.println("Rental has been successfully terminated");
            }
        }
    }
}
