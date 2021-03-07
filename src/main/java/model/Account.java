package model;

public class Account {

    private int clientId;
    private int currencyTypeId;
    private double currentBalance;
    private double dailyLimit;

    public Account(int clientId, int currencyTypeId) {
        this.clientId = clientId;
        this.currencyTypeId = currencyTypeId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getCurrencyTypeId() {
        return currencyTypeId;
    }

    public void setCurrencyTypeId(int currencyTypeId) {
        this.currencyTypeId = currencyTypeId;
    }

    public double getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(double currentBalance) {
        this.currentBalance = currentBalance;
    }

    public double getDailyLimit() {
        return dailyLimit;
    }

    public void setDailyLimit(double dailyLimit) {
        this.dailyLimit = dailyLimit;
    }

    @Override
    public String toString() {
        return "Account{" +
                "clientId=" + clientId +
                ", currencyTypeId=" + currencyTypeId +
                ", currentBalance=" + currentBalance +
                ", dailyLimit=" + dailyLimit +
                '}';
    }
}
