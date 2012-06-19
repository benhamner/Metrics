test.apk <- function()
{
    checkEqualsNumeric(apk(2, 1:5, c(6,4,7,1,2)), 1/4)
    checkEqualsNumeric(apk(5, 1:5, c(1,1,1,1,1)), 0.2)
    checkEqualsNumeric(apk(20, 1:100, c(1:20,200:600)), 1)
    checkEqualsNumeric(apk(3, c(1,3), 1:5), 5/6)
    checkEqualsNumeric(apk(3, 1:3, c(1,1,1)), 1/3)
    checkEqualsNumeric(apk(3, 1:3, c(1,2,1)), 2/3)    
}

test.mapk <- function()
{
    checkEqualsNumeric(mapk(10, list(1:5,1:3), list(1:10,c(1:2,4:11,3))), 5/6)
    checkEqualsNumeric(mapk(3, list(1:4), list(1:4)), 1.0)
    checkEqualsNumeric(mapk(3, list(c(1,3,4),c(1,2,4),c(1,3)), list(1:5,1:5,1:5)), 0.685185185185185)
    checkEqualsNumeric(mapk(5, list(1:5,1:5), list(c(6,4,7,1,2),c(1,1,1,1,1))), 0.26)
    checkEqualsNumeric(mapk(3, list(c(1,3),1:3,1:3), list(1:5,c(1,1,1),c(1,2,1))), 11/18)

}