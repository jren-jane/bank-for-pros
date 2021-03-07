package model;

public class TransferTask extends Task {

    private AccountDatabaseUtil accountDatabaseUtil;
    private AccountDatabaseUtil targetAccountDatabaseUtil;

    @Override
    protected void doExecute(Account account, Account targetAccount, double amount) throws Exception {
        accountDatabaseUtil = new AccountDatabaseUtil(account);
        Double ownAmount = accountDatabaseUtil.getBalance();
        Double updatedOwnAmount = ownAmount - DefaultValues.defaultExchangeRate(account.getCurrencyTypeId(), targetAccount.getCurrencyTypeId()) * amount;

        targetAccountDatabaseUtil = new AccountDatabaseUtil(targetAccount);
        Double targetAmount = targetAccountDatabaseUtil.getBalance();
        Double updatedTargetAmount = targetAmount + amount;

        accountDatabaseUtil.updateBalance(updatedOwnAmount);
        targetAccountDatabaseUtil.updateBalance(updatedTargetAmount);
    }
}
