import numpy as np

def levenshtein(str1, str2):
    m = len(str1)
    n = len(str2)
    distance_matrix = np.zeros((m+1, n+1))
    distance_matrix[range(m+1),0] = range(m+1)
    distance_matrix[0,range(n+1)] = range(n+1)

    for i in range(1,m+1):
        for j in range(1,n+1):
            if str1[i-1]==str2[j-1]:
                distance_matrix[i,j] = distance_matrix[i-1,j-1]
            else:
                distance_matrix[i,j] = min(distance_matrix[i-1,j]+1, 
                                           distance_matrix[i,j-1]+1,
                                           distance_matrix[i-1,j-1]+1)

    return distance_matrix[m,n]
