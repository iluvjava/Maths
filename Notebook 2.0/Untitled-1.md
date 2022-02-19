Generating Anagram

s1 s1 s1, s2
```
[s1], [[s1, s1], [s2]]
    [s1, s1], [[s1], [s2]]
        [s1, s1, s1], [[], [s2]]
            [s1, s1, s1, s2], [[], []] BASE CASE
            END
        END
        [s1, s1, s2], [[s1], []]
            [s1, s1, s2, s1], [[], []] BASE CASE
            END
        END
    [s1, s2], [[s1, s1], []]
        [s1, s2, s1], [[s1], []]
            [s1, s2, s1, s1], [[], []] BASE CASE
            END
        END
    END
[s2], [[s1, s1, s1], []]
    [s2, s1], [[s1, s1], []]
        [s2, s1, s1], [[s1], []]
            [s2, s1, s1, s1], [[], []] BASE CASE
            END
        END
    END
END
```

    