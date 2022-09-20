package Lab1.exercise1;

public class MatchingSystem {
    // variables
    /**
     * jobs - array of the class JobDescription
     * applicants - array of the class Person
     * numberOfJobs - number of instanced JobDescription objects
     * numberOfApplicants - number of instanced Person objects
     * maximumNumberOfJobs - max number of objects in the jobs array
     * maximumNumberOfApplicants - max number of objects in the applicants array
     */
    private JobDescription[] jobs;
    private Person[] applicants;
    private int numberOfJobs;
    private int numberOfApplicants;
    private int maximumNumberOfJobs;
    private int maximumNumberOfApplicants;


    // constructor

    /**
     * setting maximumNumberOfApplicants to 6
     * setting maximumNumberOfJobs to 3
     * allocating max space for jobs array
     * allocating max space for applicants array
     */
    public MatchingSystem(){

        maximumNumberOfApplicants = 6;
        maximumNumberOfJobs = 3;
        jobs = new JobDescription[maximumNumberOfJobs];
        applicants = new Person[maximumNumberOfApplicants];

    }

    public int getMaximumNumberOfApplicants() {
        return maximumNumberOfApplicants;
    }

    public int getMaximumNumberOfJobs() {
        return maximumNumberOfJobs;
    }

    public int getNumberOfApplicants() {
        return numberOfApplicants;
    }

    public int getNumberOfJobs() {
        return numberOfJobs;
    }

    public JobDescription[] getJobs() {
        return jobs;
    }

    public Person[] getApplicants() {
        return applicants;
    }

    public void setApplicants(Person[] applicants) {
        this.applicants = applicants;
    }

    public void setJobs(JobDescription[] jobs) {
        this.jobs = jobs;
    }

    public void setMaximumNumberOfApplicants(int maximumNumberOfApplicants) {
        this.maximumNumberOfApplicants = maximumNumberOfApplicants;
    }

    public void setMaximumNumberOfJobs(int maximumNumberOfJobs) {
        this.maximumNumberOfJobs = maximumNumberOfJobs;
    }

    public void setNumberOfApplicants(int numberOfApplicants) {
        this.numberOfApplicants = numberOfApplicants;
    }

    public void setNumberOfJobs(int numberOfJobs) {
        this.numberOfJobs = numberOfJobs;
    }


    // methods
    /**
     * This method receives as input a job description and adds it as the next
     * element to the job array. If the job array is not full, and the new job is
     * successfully added, an acknowledgement message is printed on the screen
     * along with the total number of jobs in the system.
     *
     * @param jobDesc - job description
     */
    public void addJob(JobDescription jobDesc){
        for(int i = 0; i < jobs.length; i++){
            if(jobs[i] == null){
                jobs[i] = jobDesc;
                System.out.println(jobs[i] + " has been successfully added to the system. Current number of jobs in the system = " + (i+1));
                break;
            }
            else if(i == jobs.length-1){
                System.out.println("Job " + jobDesc + " could not be added to the matching system because the system is full.");
                break;
            }

        }
        
    }








    /**
     * This method receives as input an applicant person profile and adds it as the
     * next element to the applicants array. If the person array is not full and the new
     * Person could be successfully added, an acknowledgement message is printed on
     * the screen along with the total number of applicants in the system.
     *
     * @param personProfile - a person profile
     */
    public void addApplicant(Person personProfile){
        for(int i = 0; i < applicants.length; i++){
            if(applicants[i] == null){
                applicants[i] = personProfile;
                System.out.println(applicants[i] + " has been successfully added. Current number of applicants in the system = " + (i+1));
                break;
            }
        }
    }








    /**
     * This method lists all (job description - applicant) matches.
     * In order for a person to be matched to a job, the following
     * must be satisfied: ( job and person must be in the same city ) AND ( the
     * person's skill must match the skill required by the job ) AND ( the person
     * must meet the minimum years of experience ).
     3
     *
     * @return the total number of suitable assignments
     */
    public int listSuitableAssignments(){
        int count = 0;
        for(int j = 0; j < jobs.length; j++) {
            for(int i = 0; i < applicants.length; i++) {
                    if(applicants[i] != null && jobs[j] != null && applicants[i].getLocation().equals(jobs[j].getLocation()) && applicants[i].getSkill().equals(jobs[j].getSkillRequired()) && applicants[i].getYearsOfExperience() >= jobs[j].getYearsOfExperienceRequired()) {
                        System.out.println("Match found = " + jobs[j] + " TO " + applicants[i]);
                        count++;
                        break;
                    }
                    else if(i == applicants.length - 1){
                        System.out.println("No suitable applicants for job " + jobs[j]);
                    }
            }
        }
        return count;
    }
}
