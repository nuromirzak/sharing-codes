package codes.sharing.sharingcodes.dto;

public class PasswordDTO {

    public PasswordDTO(String password, String id) {
        this.password = password;
        this.id = id;
    }

    public PasswordDTO(String password) {
        this.password = password;
    }
    public PasswordDTO() {
        this.password = "";
    }

    private String password;
    private String id;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
