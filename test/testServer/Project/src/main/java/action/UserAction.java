package action;


import model.Parameter.Personal;
import util.Database;

public class UserAction {
    public Personal person = new Personal();
    public Database db = new Database();

    public Database getDb() {
        return db;
    }

    public void setDb(Database db) {
        this.db = db;
    }

    public Personal getPerson() {
        return person;
    }

    public void setPerson(Personal person) {
        this.person = person;
    }

    public String execute() {
        db.CheckLogin(person);
        return "SUCCESS";
    }
}


