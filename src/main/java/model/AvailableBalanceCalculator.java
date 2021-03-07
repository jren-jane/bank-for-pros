package model;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

public class AvailableBalanceCalculator {
    long millis = System.currentTimeMillis();
    Date transactionDate = new Date(millis);
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private String stringTransactionDate = dateFormat.format(transactionDate);

    private Account account;

    public AvailableBalanceCalculator(Account account) {
        this.account = account;
    }

    public Double calculateAvailableBalance() throws Exception {
        TransactionsDatabaseUtil transactionsDatabaseUtil = new TransactionsDatabaseUtil(account);
        AccountDatabaseUtil accountDatabaseUtil = new AccountDatabaseUtil(account);

        List<Transaction> transactions = transactionsDatabaseUtil.getTransactionRecords(stringTransactionDate, stringTransactionDate, "", "0", Integer.toString(DefaultValues.defaultCurrencyTypeId));
        Double dailyLimit = accountDatabaseUtil.getDailyLimit();
        double currentBalance = accountDatabaseUtil.getBalance();

        double dailySum = 0.00;

        for (Transaction transaction : transactions) {
            String dailySumTemp = transaction.getTransactionAmount().replace(",","");
            dailySum += Double.parseDouble(dailySumTemp);
        }

        return Math.min(dailyLimit + dailySum, currentBalance);

    }

}
