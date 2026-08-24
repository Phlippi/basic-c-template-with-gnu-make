#include <iostream>
#include <random>
#include <string>

using namespace std;

int main() {
    random_device rd;
    mt19937 rng(rd());

    while (true) {
        while (true) {
            cout << "Do you want to play a little game?" << endl;
            cout << "(y or n): " << flush;
            string result;
            cin >> result;

            if (result == "n") {
                cout << "Ok, Goodbye!" << endl;
                return 0;
            }
            if (result == "y") break;
            cout << "That was not a precise answer! Lets try again." << endl;
        }

        int n;
        cout << "To start the game you need to give me a number!" << endl;
        cout << "Whats you choice? " << flush;
        cin >> n;

        if (n <= 10) {
            cout << "Really?" << endl;
            cout << "You know what? I am sick of it. I hope I will never see you again." << endl;
            return -1;
        }

        int rand = rng() % (n - 1) + 1;

        cout << "I thought of a number between 0 and " << n << ". You now have to guess it."
             << endl;
        cout << "I will tell if you got it right and if not I will tell whether you bet higher or "
                "lower."
             << endl;

        while (true) {
            cout << "Whats you guess?" << endl;
            int guess;
            cin >> guess;

            if (guess == rand) {
                cout << "Congrats you did it. But thats not the end." << endl;
                break;
            }

            if (guess > rand) cout << "Nope. You guessed to high." << endl;
            if (guess < rand) cout << "Nope. You guessed to low." << endl;
        }
    }
}