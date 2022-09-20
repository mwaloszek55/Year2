package Lab1.exercise1;

public class JobDescription {

    // variables
    /**
     * location - String of location of company
     * company - String of company name
     * skillRequired - String of skill required for the job
     * yearsOfExperienceRequired - int of the amount of years of experience in the skill required by the job
     */
    private String location;
    private String company;
    private String skillRequired;
    private int yearsOfExperienceRequired;


    // constructors

    /**
     * if location not specified then return "None specified"
     * if company not specified then return "None specified"
     * if skillRequired not specified then return "None specified"
     * if yearsOfExperienceRequired not specified then return 0
     */
    public JobDescription(){
        location = "None specified";
        company = "None specified";
        skillRequired = "None specified";
        yearsOfExperienceRequired = 0;
    }

    /**
     *
     * @param newLocation - assigns location(string) of the company
     * @param newCompany - assigns name of the company(string)
     * @param skill - assigns skill(string) required
     * @param years - assigns years(int) of experience in skill required
     */
    public JobDescription(String newLocation, String newCompany, String skill, int years){
        location = newLocation;
        company = newCompany;
        skillRequired = skill;
        yearsOfExperienceRequired = years;
    }
    public String toString(){
        return "[" + company + ", " + location + ", " + skillRequired + "]";
    }

    public String getCompany() {
        return company;
    }

    public int getYearsOfExperienceRequired() {
        return yearsOfExperienceRequired;
    }

    public String getLocation() {
        return location;
    }

    public String getSkillRequired() {
        return skillRequired;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setSkillRequired(String skillRequired) {
        this.skillRequired = skillRequired;
    }

    public void setYearsOfExperienceRequired(int yearsOfExperienceRequired) {
        this.yearsOfExperienceRequired = yearsOfExperienceRequired;
    }
}

