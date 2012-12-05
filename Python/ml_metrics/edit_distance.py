from __future__ import division

def levenshtein(s1, s2, normalize=False):
    """
    s1: String
    s2: String

    normalize: divide edit distance by maximum length if true
    """
    if len(s1) < len(s2):
        return levenshtein(s2, s1, normalize)
    if not s2:
        return len(s1)

    previous_row = range(len(s2) + 1)
    for i, c1 in enumerate(s1):
        current_row = [i+1]
        for j, c2 in enumerate(s2):
            insertions = previous_row[j+1] + 1
            deletions = current_row[j] + 1
            substitutions = previous_row[j] + (c1 != c2)
            current_row.append(min(insertions, deletions, substitutions))
        previous_row = current_row

    if normalize:
        return (current_row[-1] / len(s1))
    return current_row[-1]