print("В этом проекте я сделаю простую реализацию игры Ним на Python")
import random

stack_1, stack_2 = random.randint(2, 10), random.randint(2, 10)
taken = 0 # сколько камней взяли
current_player = 'Игрок1' # действующий игрок
def take(stack, num): # логика программы, когда человек или компьютер берёт камни из кучи
    global taken
    if current_player == 'Компьютер':
        taken = random.randint(1, stack)
    if taken > 1:
        print(f"{current_player} взял {taken} камней из {num} кучи")
    else:
        print(f"{current_player} взял {taken} камень из {num} кучи")
    stack -= taken # вычитаем кол-во камней из кучи
    return stack

def result(): # состояние каждой из куч
    print(f"Камней из первой кучи осталось {stack_1}")
    print(f"Камней из второй кучи осталось {stack_2}")
    if stack_1 == 0 and stack_2 == 0:
        print(f"Камней больше не осталось. Выиграл {current_player}!")
        exit()

def take_computer():
    global stack_1, stack_2, current_player # глобализируем кучи и действующего игрока
    if stack_1 == 0: # если первая куча пустая
        stack_2 = take(stack_2, 2) # берём камни из второй
    elif stack_2 == 0: # если вторая куча пустая
        stack_1 = take(stack_1, 1) # берём камни из первой
    else: # если камни есть в обеих кучах
        choice = random.randint(1, 2)
        if choice == 1:
            stack_1 = take(stack_1, 1)
        else:
            stack_2 = take(stack_2, 2)

result() # выводим состояние кучек
while True: # основной игровой цикл
    if current_player == 'Компьютер':
        take_computer()
        result()
        current_player = 'Игрок1'
    else:
        select = int(input("Введите номер кучи из которой хотите взять: "))
        taken = int(input("Сколько камней вы хотите взять: "))
        if select == 1:
            stack_1 = take(stack_1, 1)
        else:
            stack_2 = take(stack_2, 2)
        result() # выводим состояние кучек
        current_player = "Компьютер"
