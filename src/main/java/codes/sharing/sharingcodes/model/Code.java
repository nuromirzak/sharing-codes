package codes.sharing.sharingcodes.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "snippets")
@JsonIgnoreProperties(value = {"id", "initialTime", "viewsLimit", "timeLimit"})
public class Code {

    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private String id = String.valueOf(UUID.randomUUID());

    @Column(name = "code", columnDefinition = "VARCHAR(4096)")
    private String code;

    @Column(name = "date")
    private String date = LocalDateTime.now().toString();

    @Column(name = "time")
    private Long time;

    @Column(name = "views")
    private Long views;

    @Column(name = "initialtime")
    private Long initialTime;

    @Column(name = "viewslimit")
    private boolean viewsLimit;

    @Column(name = "timelimit")
    private boolean timeLimit;

    @Column(name = "password")
    private String password;

    public Code() {

    }

    public Code(Code code) {
        this.id = code.getId();
        this.code = code.getCode();
        this.date = code.getDate();
        this.time = code.getTime() == null ? 0L : code.getTime();
        this.views = code.getViews() == null ? 0L : code.getViews();
        this.initialTime = code.getTime();
        if (this.views > 0) {
            this.viewsLimit = true;
        }
        if (this.time > 0) {
            this.timeLimit = true;
        }
        this.password = code.getPassword() == null ? "" : code.getPassword();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }

    public Long getViews() {
        return views;
    }

    public void setViews(Long views) {
        this.views = views;
    }

    public Long getInitialTime() {
        return initialTime;
    }

    public void setInitialTime(Long initialTime) {
        this.initialTime = initialTime;
    }

    public boolean isViewsLimit() {
        return viewsLimit;
    }

    public void setViewsLimit(boolean viewsLimit) {
        this.viewsLimit = viewsLimit;
    }

    public boolean isTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(boolean timeLimit) {
        this.timeLimit = timeLimit;
    }

    public boolean hasLimit() {
        return isViewsLimit() || isTimeLimit();
    }

    public String shortCode() {
        int n = 50;
        if (getCode().length() > n) {
            return getCode().substring(0, Math.min(getCode().length(), 10)) + "...";
        } else {
            return getCode();
        }
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
