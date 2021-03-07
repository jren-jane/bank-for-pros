package model;

public abstract class Task {
    private TransactionsDatabaseUtil transactionsDatabaseUtil;

    public Task() {}

    public void execute(Account account, Account targetAccount, double amount) throws Exception {
        transactionsDatabaseUtil = new TransactionsDatabaseUtil(account, targetAccount);
        transactionsDatabaseUtil.recordTransaction(amount);

        doExecute(account, targetAccount, amount);
    }

    protected abstract void doExecute(Account account, Account targetAccount, double amount) throws Exception;
}
