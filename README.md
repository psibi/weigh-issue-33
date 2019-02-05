# weigh-issue-33

``` shellsession
~/g/f/g/weight-issue-33 (master) $ stack exec weigh-issue-exe

Case                          Allocated  GCs
\x -> HasInt x                    -,216    0
\x -> HasPacked (HasInt x)       -3,936    0
\x -> HasUnpacked (HasInt x)         16    0
~/g/f/g/weight-issue-33 (master) $ stack exec weigh-issue-exe

Case                          Allocated  GCs
\x -> HasInt x                    -,264    0
\x -> HasPacked (HasInt x)           56    0
\x -> HasUnpacked (HasInt x)         16    0
~/g/f/g/weight-issue-33 (master) $ stack exec weigh-issue-exe

Case                          Allocated  GCs
\x -> HasInt x                       16    0
\x -> HasPacked (HasInt x)       -3,936    0
\x -> HasUnpacked (HasInt x)         16    0
```
