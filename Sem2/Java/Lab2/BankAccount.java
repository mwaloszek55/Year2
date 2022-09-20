public class BankAccount {
    //variables
    private Person accountOwner;
    private int accNum;
    private double balance;

    /**
     * The 3 argument constructor for BankAccount
     * @param accountOwner - the owner of the bank account class
     * @param accNum - number of account
     * @param balance - account balance
     */
    public BankAccount(Person accountOwner, int accNum, double balance){
        setAccountOwner(accountOwner);
        setBalance(balance);
        this.accNum = accNum;
    }

    /**
     * invoke to get balance
     * @return balance
     */
    public double getBalance() {
        return balance;
    }

    /**
     * invoke to get account number
     * @return account number
     */
    public int getAccNum() {
        return accNum;
    }

    /**
     * invoke to get account owner
     * @return account owner
     */
    public Person getAccountOwner() {
        return accountOwner;
    }

    /**
     * invoke to set account owner for bank account class
     * @param accountOwner instance of object Person
     */
    public void setAccountOwner(Person accountOwner) {
        this.accountOwner = accountOwner;
    }

    /**
     * invoke to set balance of bank account
     * @param balance of account
     */
    public void setBalance(double balance) {
        this.balance = balance;
    }

    /**
     * displays account details
     */
    public void displayAccDetails(){
        String str = "Account Owner: " + getAccountOwner().getFirstName() + " " + getAccountOwner().getLastName() +
                    "\nAccount Number: " + getAccNum() +
                    "\nAccount Balance: EUR " + getBalance();
        System.out.println(str);
    }

    /**
     * @return account details in neat matter
     */
    public String toString() {
        String str = "Account Owner: " + getAccountOwner().getFirstName() + " " + getAccountOwner().getLastName() +
                "\nAccount Number: " + getAccNum() +
                "\nAccount Balance: EUR " + getBalance();
        return str;
    }
}
