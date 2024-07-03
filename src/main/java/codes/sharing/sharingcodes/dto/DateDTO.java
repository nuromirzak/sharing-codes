package codes.sharing.sharingcodes.dto;

public class DateDTO {

    public DateDTO(String dateFormat, String timeFormat) {
        this.dateFormat = dateFormat;
        this.timeFormat = timeFormat;
    }

    private String dateFormat;
    private String timeFormat;

    public String getDateFormat() {
        return dateFormat;
    }

    public void setDateFormat(String dateFormat) {
        this.dateFormat = dateFormat;
    }

    public String getTimeFormat() {
        return timeFormat;
    }

    public void setTimeFormat(String timeFormat) {
        this.timeFormat = timeFormat;
    }
}
