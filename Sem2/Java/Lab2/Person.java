public class Person{
    //variables
    private String firstName;
    private String lastName;
    private String address;
    private final Food favoriteFood;

    /**
     *
     * @param firstName - first name of this person
     * @param lastName - last name of this person
     * @param address - address of this person
     * @param favouriteFood - favorite food of this person
     */
    public Person(String firstName, String lastName, String address, Food favouriteFood){
        this.favoriteFood = favouriteFood;
        this.setFirstName(firstName);
        this.setLastName(lastName);
        this.setAddress(address);
    }

    /**
     * invoke to return address of person
     * @return address
     */
    public String getAddress() {
        return address;
    }

    /**
     * invoke to return first name of person
     * @return first name
     */
    public String getFirstName() {
        return firstName;

    }

    /**
     * invoke to return favorite food of person (interface)
     * @return favorite food
     */
    public Food getFavoriteFood() {
        return favoriteFood;
    }

    /**
     * invoke to return last name of person
     * @return last name
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * invoke to set address of this person
     * @param address - address of this instance of person class
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * invoke to set first name of this person
     * @param firstName - first name of this instance of person class
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * invoke to set last name of person
     * @param lastName - last name of this instance of person class
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
}

