public class AccountTest {

    public static void main(String[] args){
        Vegetable cucumber = new Vegetable("Cucumber", 15, 0.7, 0.1, 2.1, 4.7, 3.1);
        Meat steak = new Meat("Steak", 275, 26, 18, 0, 0, 0);
        Person person1 = new Person("John", "Brow", "Dublin", cucumber);
        Person person2 = new Person("Bob", "Mike", "Cork", steak);

        BankAccount bankAcc1 = new BankAccount(person1, 1, 150.25);
        LoanAccount loanAcc1 = new LoanAccount(person2, 2, 250000,25);

        System.out.println("Displaying details of Bank Account:");
        bankAcc1.displayAccDetails();
        System.out.println("\n\nDisplaying details of Loan Account:");
        loanAcc1.DisplayMessage();

        System.out.println("\n\nDisplaying First Name and Balance of Bank Account Owner:");
        System.out.println("First Name: " + bankAcc1.getAccountOwner().getFirstName() + "\nBalance:"+  bankAcc1.getBalance());

        System.out.println("\n\nAdding 200 to overdraft limit");
        loanAcc1.incOverDraftLimit(200);
        System.out.println("Displaying **UPDATED** details of Loan Account:");
        loanAcc1.DisplayMessage();

        // Part 2
        System.out.println("\n\nDisplaying the people details and their favorite food!!\n");
        Person[] people = {person1, person2};
        for(Person person : people){
            if(person.getFavoriteFood().healthy()){
                System.out.println(String.format("Personal Details: %s %s, %s \nFavorite Food: %s, it is healthy.\n", person.getFirstName(), person.getLastName(), person.getAddress(), person.getFavoriteFood().getName()));
            } else {
                System.out.println(String.format("Personal Details: %s %s, %s \nFavorite Food: %s, it is not healthy.\n", person.getFirstName(), person.getLastName(), person.getAddress(), person.getFavoriteFood().getName()));
            }
        }
    }



}
