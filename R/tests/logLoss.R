test.ll <- function()
{
    checkEqualsNumeric(ll(1,1), 0)  
    checkEqualsNumeric(ll(1,0), Inf)
    checkEqualsNumeric(ll(0,1), Inf)
    checkEqualsNumeric(ll(1,0.5), -log(0.5))
}

test.logLoss <- function()
{
    checkEqualsNumeric(logLoss(c(1,1,0,0),c(1,1,0,0)), 0)
    checkEqualsNumeric(logLoss(c(1,1,0,0),c(1,1,1,0)), Inf)
    checkEqualsNumeric(logLoss(c(1,1,1,0,0,0),c(.5,.1,.01,.9,.75,.001)), 1.881797068998267)
}