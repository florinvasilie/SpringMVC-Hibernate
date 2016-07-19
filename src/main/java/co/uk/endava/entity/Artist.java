package co.uk.endava.entity;

/**
 * Created by fvasile on 7/19/2016.
 */
import javax.persistence.*;
import java.io.Serializable;
;

@Entity
@Table(name="Artist")
public class Artist implements Serializable {

    @Id
    @Column(name="origin")
    private String origin;

    @Column(name="launchDate")
    private String launchDate;


    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getLaunchDate() {
        return launchDate;
    }

    public void setLaunchDate(String launchDate) {
        this.launchDate = launchDate;
    }
}
