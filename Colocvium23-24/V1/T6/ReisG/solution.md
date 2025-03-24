Рассмотрим кусок ассемблерного кода
```nasm
mov ebx, dword [ivanov]
movsx ebx, word[ebx+6]
mov dword[ivanov_score], ebx
```

идёт обращение к полю short. Это может быть только поле 
`chocolates_gifted_per_day` ( подумайте:) ).
Ну ладно. student_id весит 4 байта, следующее за ним поле
занимает не более 2 байтов (иначе залезем в середину поля - плохо)

По условию типы этих двух полей не могут быть одинаковыми => 
`signed char lections_visited` and `signed short chocolates_gifted_per_day`

Заметим, что что выравнивание структуры по условию происходит по 8 байтовой границе.
Следовательно, существует поле размером 8 байтов. Этим полем может быть только поле
`exam_score`. 8 байтов кушает только double. Итого `double exam_score`.

Структура имеет такой вид
```C
struct student_scoring {
    const char *student_id;
    signed char lections_visited;
    signed short chocolates_gifted_per_day;
    union
    {
        double exam_score;
        int (*test_scores)[5]; 
    };
    signed char times_drank_near_machines;
} *ivanov;
int ivanov_score;
```

Прекрасно, осталось посчитать смещение относительно начала структуры.
Пишу memory mapping. Один символ - один байт. Первый байт поля - первая буква поля.
Занятые байты X, байты выравнивания 0
```
sXXXl0cX uXXXXXXX t0000000
```

Пишем ответ:
```
A B E
0 4 6 8 8 16
```