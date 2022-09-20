public class LoanAccount extends BankAccount{
    //variables
    private double overDraftLimit;
    public LoanAccount(Person accountOwner, int accNum, double balance, double overDraftLimit){
        super(accountOwner, accNum, balance);
        setOverDraftLimit(overDraftLimit);
    }

    /**
     * invoke to return over draft limit value
     * @return overDraftLimit value
     */
    public double getOverDraftLimit() {
        return overDraftLimit;
    }

    /**
     * invoke to set over draft limit value
     * @param overDraftLimit overDraftLimit value
     */
    public void setOverDraftLimit(double overDraftLimit) {
        this.overDraftLimit = overDraftLimit;
    }

    /**
     * prints account details and overdraft limit
     */
    public void DisplayMessage(){
        super.displayAccDetails();
        System.out.println("Overdraft Limit: " + overDraftLimit);
    }

    /**
     *
     * @return account details and overdraft limit
     */
    public String toString() {
        String str = super.toString();
        str += "\nOverdraft Limit: " + overDraftLimit;
        return str;
    }

    /**
     * invoke to increase overDraftLimit int by amountInc
     * @param amountInc increases overDraftLimit by this integer
     */
    public void incOverDraftLimit(double amountInc) {
        this.overDraftLimit += amountInc;
    }

}
