
#include <stdio.h>
#include <cstdlib>
#include <iostream>
#include <conio.h>
using std::cout;
using std::cin;
using std::endl;
using std::string;
int main() {
    setlocale(LC_ALL, "Russian");
    while(true) {
        char buffer[9999];
        int a = 0;
        int b, menu;
        cout << "Нажмите 0 чтобы выйти, 1 чтобы перевести число из шестнадцатиричной системы в другую, \n\
2 чтобы перевести число из восьмиричной системы в другую, 3 чтобы перевести число из десятичной в другую: "; 
        menu = getch();
        cout << endl;
        if(menu == 48) {
            cout << "До свидания." << endl;
            return 0;
        }
        if(menu == 49) {
            cout << "Введите число в шестнадцатиричной системе счисления: ";
            cin >> std::hex >> a;
            cout << "Введите основание системы счисления, в которую надо перевести число: ";
            cin >> std::dec >> b;
            if(b < 2 || b > 36) {
                cout << "Системы счисления не существует." << endl;

            }
            else {
                cout << "Результат: " << itoa(a, buffer, b) << endl;
            }
        }
        if(menu == 50) {
            cout << "Введите число в восьмиричной системе счисления: ";
            cin >> std::oct >> a;
            cout << "Введите основание системы счисления, в которую надо перевести число: ";
            cin >> std::dec >> b;
            if(b < 2 || b > 36) {
                cout << "Системы счисления не существует." << endl;
            }
            else {
                cout << "Результат: " << itoa(a, buffer, b) << endl;
            }
        }
        if(menu == 51) {
            cout<< "Введите число, которое хотите перевести: ";
            cin >> a;
            cout << "Введите основание системы счисления,\n\
в которую вы хотите перевести число: ";
            cin >> b;
            if(b < 2 || b > 36) {
                cout << "Системы счисления не существует." << endl;
            }
            else {
                cout << "Результат: " << itoa(a, buffer, b) << endl;
            }
        }
    }
    return 0;
}
