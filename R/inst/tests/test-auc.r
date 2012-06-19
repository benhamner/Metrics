test.auc <- function()
{
    checkEqualsNumeric(auc(c(1,0,1,1), c(.32,.52,.26,.86)), 1/3)
    checkEqualsNumeric(auc(c(1,0,1,0,1),c(.9,.1,.8,.1,.7)), 1)
    checkEqualsNumeric(auc(c(0,1,1,0),c(.2,.1,.3,.4)), 1/4)
    checkEqualsNumeric(auc(c(1,1,1,1,0,0,0,0,0,0),0*(1:10)), 0.5)    
}
