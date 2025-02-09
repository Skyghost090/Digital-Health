#include <csignal>
#include <cstdlib>
#include <stdio.h>
#include <stdbool.h>
#include "timeout.h"
#include <bits/stdc++.h>
#include "csv-parser/include/csv.hpp"

using namespace csv;

int verifyTime(std::string appName){
    CSVReader reader("times.csv");
    CSVReader reader2("timeout.csv");
    std::string sum, sum2;
    //char command[100];

    for (auto& row: reader) {
        sum = row[appName].get<std::string>();
    }
    for (auto& row2: reader2) {
        sum2 = row2[appName].get<std::string>();
    }
    char arr[appName.length() + 1];

    // Specify the ranges
    auto first = appName.begin();
    auto last = appName.end();

    // Convert the string to char array
    copy(first, last, arr);
    std::string command = "killall " + appName;;
    if(sum == sum2){
        return system(command.c_str());
    } else {
        printf("time not endend..\n");
        return 0;
    }
}

int main(int argc, char** argv){
    if (argv[1]){
        return verifyTime(argv[1]);
    } else {
        printf("Please put app name\n");
        return 1;
    }
}
