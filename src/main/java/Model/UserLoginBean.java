package Model;

public class UserLoginBean {
    String userLoginId;
    String password;
    int employeeId;

    public UserLoginBean(String userLoginId, String password) {
        this.userLoginId = userLoginId;
        this.password = password;
    }

    public UserLoginBean() {
    }

    public String getUserLoginId() {

        return userLoginId;
    }
    public void setUserLoginId(String userLoginId) {

        this.userLoginId = userLoginId;
    }


    public String getPassword() {

        return password;
    }
    public void setPassword(String password) {

        this.password = password;
    }


    public int getEmployeeId() {

        return employeeId;
    }
    public void setEmployeeId(int employeeId) {

        this.employeeId = employeeId;
    }

    @Override
    public String toString() {
        return "UserLoginBean{" +
                "userLoginId='" + userLoginId + '\'' +
                ", password='" + password + '\'' +
                ", employeeId=" + employeeId +
                '}';
    }
}
