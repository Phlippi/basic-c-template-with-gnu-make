#include <iostream>
#include <string>

#include "demo.hpp"

int main() {
    while (true) {
        std::cout << "Whats your name?" << std::endl;
        std::string name;
        std::getline(std::cin, name);
        std::cout << Greeting(name) << std::endl;
    }
}
