#include <bits/stdc++.h>
#include <iostream>
using namespace std;
#define rep(i, n) for (int i = 0; i < (int)(n); ++i)
typedef long long ll;

int solve(int people, int A)
{
    if (people % A == 0)
        return people / A;
    else
        return -1;
}

int main()
{
    int people = 400;
    int A;
    cin >> A;

    int ans = solve(people, A);
    cout << ans << endl;
}