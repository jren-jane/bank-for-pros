package model;

import java.sql.Date;

public class Transaction {
    private Date transactionDate;
    private String transactionAmount;
    private int clientId;
    private String clientEmail;
    private int targetId;
    private String targetEmail;
    private int currencyTypeId;
    private String currencyName;

    public Transaction (Date transactionDate, String transactionAmount, int clientId, String targetEmail, String currencyName)
    {
        this.transactionDate = transactionDate;
        this.transactionAmount = transactionAmount;
        this.clientId = clientId;
        this.targetEmail = targetEmail;
        this.currencyName = currencyName;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getTransactionAmount() { return transactionAmount; }

    public void setTransactionAmount(String transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public String getClientEmail() {
        return clientEmail;
    }

    public void setClientEmail(String clientEmail) {
        this.clientEmail = clientEmail;
    }

    public int getTargetId() {
        return targetId;
    }

    public void setTargetId(int targetId) {
        this.targetId = targetId;
    }

    public String getTargetEmail() {
        return targetEmail;
    }

    public void setTargetEmail(String targetEmail) {
        this.targetEmail = targetEmail;
    }

    public int getCurrencyTypeId() {
        return currencyTypeId;
    }

    public void setCurrencyTypeId(int currencyTypeId) {
        this.currencyTypeId = currencyTypeId;
    }

    public String getCurrencyName() {
        return currencyName;
    }

    public void setCurrencyName(String currencyName) {
        this.currencyName = currencyName;
    }

    @Override
    public String toString() {
        return "Transaction{" +
                "transactionDate=" + transactionDate +
                ", transactionAmount='" + transactionAmount + '\'' +
                ", clientId=" + clientId +
                ", clientEmail='" + clientEmail + '\'' +
                ", targetId=" + targetId +
                ", targetEmail='" + targetEmail + '\'' +
                ", currencyTypeId=" + currencyTypeId +
                ", currencyName='" + currencyName + '\'' +
                '}';
    }
}
