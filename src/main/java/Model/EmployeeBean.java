package Model;

public class EmployeeBean {
    int employeeId;
    String firstName;
    String lastName;
    String address;
    String gender;
    int salary;
    String birthdate;

    public EmployeeBean(int employeeId, String firstName, String lastName, String address, String gender, int salary, String birthdate) {
        this.employeeId = employeeId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.gender = gender;
        this.salary = salary;
        this.birthdate = birthdate;
    }

    public EmployeeBean() {
    }

    public int getEmployeeId() {

        return employeeId;
    }
    public void setEmployeeId(int employeeId) {

        this.employeeId = employeeId;
    }


    public String getFirstName() {

        return firstName;
    }
    public void setFirstName(String firstName) {

        this.firstName = firstName;
    }


    public String getLastName() {

        return lastName;
    }
    public void setLastName(String lastName) {

        this.lastName = lastName;
    }


    public String getAddress() {

        return address;
    }
    public void setAddress(String address) {

        this.address = address;
    }


    public String getGender() {

        return gender;
    }
    public void setGender(String gender) {

        this.gender = gender;
    }

    public int getSalary() {

        return salary;
    }

    public String getBirthdate() {

        return birthdate;
    }

    @Override
    public String toString() {
        return "EmployeeBean{" +
                "employeeId=" + employeeId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", address='" + address + '\'' +
                ", gender='" + gender + '\'' +
                ", salary=" + salary +
                ", birthdate='" + birthdate + '\'' +
                '}';
    }

    public void setSalary(int salary) {
    }

    public void setBirthdate(String birthdate) {
    }
}
