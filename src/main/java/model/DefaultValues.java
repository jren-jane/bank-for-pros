package model;

public class DefaultValues {
    public static int defaultCurrencyTypeId = 1;
    public static Double defaultInitialBalance = 1000000.00;
    public static Double defaultDailyLimit = 10000.00;
    public static Double defaultExchangeRate(int currencyTypeId, int targetCurrencyTypeId) {
        if (currencyTypeId == 1 && targetCurrencyTypeId == 2) return 0.83;
        else if (currencyTypeId == 2 && targetCurrencyTypeId == 1) return 1.21;
        else return 1.00;
    }
}
