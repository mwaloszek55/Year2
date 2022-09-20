public class Vegetable implements Food{
    //variables of interface Food
    private String name;
    private int kCal;
    private double protein;
    private double fat;
    private double vitaminA;
    private double vitaminB;
    private double vitaminC;
    private boolean isHealthy;

    /**
     * constructor with 7 arguments for vegetable class
     * @param name - name of food
     * @param kCal - calories of food
     * @param protein - protein in food in g per 100g
     * @param fat - fat in food in g per 100g
     * @param vitaminA - contents of vitamin A in food
     * @param vitaminB - contents of vitamin B in food
     * @param vitaminC - contents of vitamin C in food
     * invokes setsHealthy method to determine whether food is healthy or not.
     */
    public Vegetable(String name, int kCal, double protein, double fat, double vitaminA, double vitaminB, double vitaminC){
        this.name = name;
        this.kCal = kCal;
        this.protein = protein;
        this.fat = fat;
        this.vitaminA = vitaminA;
        this.vitaminB = vitaminB;
        this.vitaminC = vitaminC;
        setHealthy();
    }

    /**
     * mathematical equation given in Part 2 of assignment to determine healthiness of food.
     * if fat and calories are greater than the sum contents of vitamin A, B and C then it is unhealthy, otherwise it is healthy.
     */
    public void setHealthy(){
        double vitTotal;
        double otherTotal;

        otherTotal = this.kCal + this.fat;
        vitTotal = this.vitaminA + this.vitaminC + this.vitaminB;
        if(otherTotal > vitTotal){
            isHealthy = false;
        }
        else{
            isHealthy = true;
        }
    }



    /**
     * invoke to return name of food
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * invoke to return calories of food
     * @return calories
     */
    public int getKCals() {
        return kCal;
    }

    /**
     * invoke to return protein in food
     * @return protein
     */
    public double getProtein() {
        return protein;
    }

    /**
     * invoke to return fat in food
     * @return fat
     */
    public double getFat() {
        return fat;
    }

    /**
     * invoke to return contents of vitamin A
     * @return vitamin A
     */
    public double getVitaminA() {
        return vitaminA;
    }

    /**
     * invoke to return contents of vitamin B
     * @return vitamin B
     */
    public double getVitaminB() {
        return vitaminB;
    }

    /**
     * invoke to return contents of vitamin C
     * @return vitamin C
     */
    public double getVitaminC() {
        return vitaminC;
    }

    /**
     * invoke to return whether food is healthy or not.
     * @return food is healthy or not.
     */
    public boolean healthy() {
        return isHealthy;
    }

    /**
     * prints details of the food in neat fashion.
     */
    public void display() {
        String str = "Food Name: " + getName() +
                "\nCalories: " + getKCals() +
                "\nProtein(per 100g): " + getProtein() + "g" +
                "\nFat(per 100g): " + getFat() + "g" +
                "\nVitamin A: " + getVitaminA() + "%" +
                "\nVitamin B: " + getVitaminB() + "%" +
                "\nVitamin C: " + getVitaminC() + "%";
        System.out.println(str);
    }
}
