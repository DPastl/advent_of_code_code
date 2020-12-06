def test_list(test_list, test_num1, test_num2):
    for low_num in test_list:
        sum = test_num1 + test_num2 + low_num
        if sum == 2020:
            return [test_num1, test_num2, low_num]
        elif sum > 2020:
            return None

if __name__ == '__main__':
    with open ('../day_2/input.txt', 'r') as inputfile:
        numbers = inputfile.readlines()

    numbers = [int(num) for num in numbers]
    numbers.sort()

    for low_num_1 in numbers:
        for low_num_2 in numbers:
            retval = test_list(numbers, low_num_1, low_num_2)
            if retval is not None:
                retval += [retval[0] * retval[1] * retval[2]]
                print("Solution is {}, {}, {}, mutliplied are {}".format(*retval))
                break
