install.packages("quantmod")
library(quantmod)
AAPL<-getSymbols("AAPL", env=NULL)
head(AAPL)
samsung<-getSymbols("005930.ks", env=NULL)
head(samsung)

dataparser("^IXIC")
NASDAQ<-getSymbols("^IXIC", env=NULL)
head(NASDAQ)
write.csv(NASDAQ,file = '/kkhsarotto/financialdata/NASDAQ.csv')
dataparser<-function(x){
  filepath<-paste('/kkhsarotto/financialdata/',x,'.csv')
  write.csv(getSymbols(x, env= NULL),
            file = filepath)
}
dataparser("2222.SR")
dataparser("FB")
dataparser("AMZN")
dataparser("GOOG")
dataparser("DJIA")
dataparser("^GSPC")
dataparser("^FTSE")
dataparser("HYMTF")
dataparser("000660.KS")
dataparser("NFLX")
dataparser("^VIX")
dataparser("GC=F")
dataparser("DELL")
dataparser("INTC")
dataparser("CSCO")
dataparser("PEP")
dataparser("NDVN")
dataparser("AMGN")
dataparser("ADBE")
dataparser("COST")
dataparser("PYPL")
dataparser("AVGO")
dataparser("QCOM")
dataparser("TXN")
dataparser("BKNG")
dataparser("MSFT")
dataparser("CMCSA")
dataparser("BRK-B")
dataparser("BABA")
dataparser("JPM")
dataparser("WMT")
dataparser("XOM")
dataparser("V")
dataparser("T")
dataparser("NKE")
dataparser("SBUX")
dataparser("BTC-USD")
dataparser("JPY=X")
dataparser("CAS=X")
dataparser("EURUSD=X")
dataparser("DX=F")
