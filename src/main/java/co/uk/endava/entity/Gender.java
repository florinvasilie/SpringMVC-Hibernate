package co.uk.endava.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fvasile on 7/19/2016.
 */
@Entity
@Table(name="Gender")
public class Gender {
    @Id
    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @Column(name="artistOrigin")
    private String artistOrigin;

    @Column(name="firstApperedIn")
    private String firstApperedIn;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getArtistOrigin() {
        return artistOrigin;
    }

    public void setArtistOrigin(String artistOrigin) {
        this.artistOrigin = artistOrigin;
    }

    public String getFirstApperedIn() {
        return firstApperedIn;
    }

    public void setFirstApperedIn(String firstApperedIn) {
        this.firstApperedIn = firstApperedIn;
    }
}
