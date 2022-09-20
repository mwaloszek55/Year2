package Lab1.exercise1;

public class Person {
    // variables
    /**
     * name = String for name of person
     * gender = int for gender: 1 = male, 2 = female, 3 = prefers to not say
     * location = String for location of residence
     * skill = String for person's skill
     * yearsOfExperience = int for number of years of experience in specific skill
     */
    private String name;
    private int gender;
    private String location;
    private String skill;
    private int yearsOfExperience;

    // constructor
    /**
     *
     * @param newName - assigns the name(string) of the person
     * @param newGender - assigns the gender(int) of the person
     * @param newLocation - assigns location(string) of residence to person
     */
    public Person(String newName, int newGender, String newLocation){
        name = newName; // name = given name
        gender = newGender; // gender = given gender
        location = newLocation; // location = given location
    }


    // methods
    /**
     * This method adds a skill to a person. In this program, a person need not have
     * a skill. A new skill overrides the previous skill.
     *
     * @param newSkill - a new skill
     * @param years - years of experience of the applicant for the given
     * skill. Negative values are not accepted.
     * @param isOutputON - if this parameter is set to true, the added skill
     * is printed on the screen. If not, the new added
     * skill is not printed.
     */
    public void addSkill(String newSkill, int years, boolean isOutputON){
        skill = newSkill;
        yearsOfExperience = years;
        if(isOutputON){
            System.out.println(name + " has new skill = " + skill + " with experience of " + years + " years");
        }
    }
    public boolean equals(Person person){
        if(this.getName().equals(person.getName()) && this.getGender() == person.getGender() && this.getLocation().equals(person.getLocation())){
            return true;
        }
        else{
            return false;
        }

    }

    public String toString(){ //
        if(gender == 1){
            return name + "[male], " + location;
        }
        else if(gender == 2){
            return name + "[female], " + location;
        }
        else{
            return name + "[prefers not to say], " + location;
        }
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLocation() {
        return location;
    }

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public int getGender() {
        return gender;
    }

    public String getName() {
        return name;
    }

    public String getSkill() {
        return skill;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }
}

