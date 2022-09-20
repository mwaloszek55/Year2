package Lab1.exercise1;

/**
 * This class is used as a testing class for our methods.
 * @author bgenc
 *
 */
public class Tester {
	public static void main(String[] args) {

		//This piece of code will be used at the final stage, when all the hints are completed.
		 
		System.out.println("Welcome to super-match system!");

		// initialize the system
		MatchingSystem system = new MatchingSystem();

		// create job descriptions
		JobDescription job1 = new JobDescription("Dublin", "TikTok", "NLP", 1);
		JobDescription job2 = new JobDescription("Dublin", "IBM", "Security", 5);
		JobDescription job3 = new JobDescription("Cork", "Apple", "Constraint Programming", 5);
		JobDescription job4 = new JobDescription("Cork", "UCC", "PhD in Optimization", 1);

		// add jobs to the system
		System.out.println("\nPopulating jobs");
		system.addJob(job1);
		system.addJob(job2);
		system.addJob(job3);
		system.addJob(job4);

		// create person profiles
		System.out.println("\nCreating applicant profiles");
		
		Person person1 = new Person("Arya", 2, "Cork");
		person1.addSkill("Computer graphics", 2, true);

		Person person2 = new Person("John", 3, "Cork");
		person2.addSkill("Constraint Programming", 6, true);

		Person person3 = new Person("Rory", 1, "Dublin");
		person3.addSkill("NLP", 5, true);

		Person person4 = new Person("Brian", 1, "Kerry");
		person4.addSkill("Optimization", 5, true);

		Person person5 = new Person("John", 1, "Cork");
		person5.addSkill("Security", 1, true);

		
		// add persons to the system
		System.out.println("\nPopulating applicants");
		system.addApplicant(person1);
		system.addApplicant(person2);
		system.addApplicant(person3);
		system.addApplicant(person4);
		system.addApplicant(person5);


		// check if two persons are the same
		System.out.println("\nEquality checks...");
		
		Person person6 = new Person("John", 3, "Cork");
		person6.addSkill("Visualisation", 1, false);
		Person person7 = person2;
		
		if(person1.equals(person5))
			System.out.println("Equals method test: " + person1 + " and " + person5 + " are the same.");
		else
			System.out.println("Equals method test: " + person1 + " and " + person5 + " are not the same.");
		
		if(person2.equals(person6))
			System.out.println("Equals method test: " + person2 + " and " + person6 + " are the same.");
		else
			System.out.println("Equals method test: " + person2 + " and " + person6 + " are not the same.");
		
		if(person2 == person6)
			System.out.println("== test for different instances: " + person2 + " and " + person6 + " are the same.");
		else
			System.out.println("== test for different instances: " + person2 + " and " + person6 + " are not the same.");
		
		if(person2 == person7)
			System.out.println("== test for reference operator: " + person2 + " and " + person7 + " are the same.");
		else
			System.out.println("== test for reference operator: " + person2 + " and " + person7 + " are not the same.");
		
		
		// find and list all possible assignments
		System.out.println("\n*** Listing all assignments");
		system.listSuitableAssignments();
	}
}
